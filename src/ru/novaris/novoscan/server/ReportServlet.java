package ru.novaris.novoscan.server;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.hibernate.Session;
import org.hibernate.connection.ConnectionProvider;
import org.hibernate.engine.SessionFactoryImplementor;


import ru.novaris.novoscan.client.resources.ImplConstants;
import ru.novaris.novoscan.util.HibernateUtil;

/**
 * 
 * @author E.A. Kurensky
 */
public class ReportServlet extends HttpServlet implements ImplConstants {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String jasperFileName;

	private Session session;

	private Connection connection;

	private String jasperFileExtensions;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		FileInputStream fileInputStream;
		BufferedInputStream bufferedInputStream;
		final StringWriter stringWriter = new StringWriter();
		final PrintWriter printWriter = new PrintWriter(stringWriter);

		try {
			// set header as text
			response.setHeader("Expires", "0");
			response.setHeader("Cache-Control",
					"must-revalidate, post-check=0, pre-check=0");
			response.setHeader("Pragma", "public");
			Map<String, Object> params = new HashMap<String, Object>();
			Map<String, String[]> servletParams = request.getParameterMap();

			// get report location
			ServletContext context = getServletContext();
			final String reportLocation = context.getRealPath("WEB-INF")
					+ REPORT_FILE_DIR;
			final String tempLocation = context.getRealPath("/")
					+ TEMP_FILE_DIR;

			Set<?> entrySet = servletParams.entrySet();
			Iterator<?> it = entrySet.iterator();
			while (it.hasNext()) {
				@SuppressWarnings("unchecked")
				Map.Entry<String, String[]> entry = (Entry<String, String[]>) it
						.next();
				String paramName = entry.getKey();
				String[] paramValues = entry.getValue();
				if (paramValues.length >= 1) {
					if (paramName.equalsIgnoreCase(REPORT_FILE)) {
						jasperFileName = paramValues[0];
					} else if(paramName.equalsIgnoreCase(FORMAT_FILE)) {
						jasperFileExtensions = paramValues[0];
					} else if(paramName.equalsIgnoreCase(COOKIE_TIMEZONE_OFFSET)) {
						params.put(paramName, Integer.valueOf(paramValues[0]));
					} else {
						params.put(paramName, paramValues[0]);
					}
				}

			}
			final StringBuffer tempData = new StringBuffer();
			final String fileName = UUID.randomUUID().toString();
			String fullFileName = new StringBuffer()
					.append(jasperFileName).append("_").append(fileName)
					.append(".").append(jasperFileExtensions).toString();;
			
			String realFileName = tempData.append(tempLocation)
					.append(fullFileName).toString();
			tempData.setLength(0);
			String reportFileName = tempData.append(TEMP_FILE_DIR)
					.append(fullFileName).toString();

			tempData.setLength(0);
			fileInputStream = new FileInputStream(tempData
					.append(reportLocation).append(jasperFileName)
					.append(JASPER_FILE_EXTENSION).toString());
			bufferedInputStream = new BufferedInputStream(fileInputStream);
			JasperReport jasperReport = (JasperReport) JRLoader
					.loadObject(bufferedInputStream);
			fileInputStream.close();
			bufferedInputStream.close();

			session = HibernateUtil.getSessionFactory().openSession();
			SessionFactoryImplementor sessionFactoryImplementation = (SessionFactoryImplementor) session
					.getSessionFactory();
			ConnectionProvider connectionProvider = sessionFactoryImplementation
					.getConnectionProvider();
			connection = connectionProvider.getConnection();
			connection.setAutoCommit(true);
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					jasperReport, params, connection);
			
			if (jasperFileExtensions.equals("xls")) {
				JExcelApiExporter xlsExporter = new JExcelApiExporter();
				xlsExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
				xlsExporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, realFileName);
				xlsExporter.exportReport();
			} else {
				JasperExportManager
				.exportReportToPdfFile(jasperPrint, realFileName);				
			}


			connection.close();
			session.close();
			response.setContentType("text/plain");
			response.getOutputStream().print(reportFileName);
		} catch (Exception e) {
			closeAll();
			e.printStackTrace(printWriter);
			response.setStatus(HttpServletResponse.SC_SERVICE_UNAVAILABLE);
			response.setContentType("text/plain");
			response.getOutputStream().print(stringWriter.toString());
        }

	}

	protected void finalize() {
		closeAll();
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Novoscan Reporting Servlet";
	}

	private void closeAll() {
		if (session.isOpen()) {
			session.close();
		}
		try {
			if (!connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
		}
	}
}
