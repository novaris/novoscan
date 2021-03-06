/**
 * 
 */
package ru.novaris.novoscan.client;

import java.util.Date;
import java.util.List;

import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Response;
import com.google.gwt.http.client.URL;
import com.google.gwt.i18n.client.DateTimeFormat;

import ru.novaris.novoscan.client.resources.DateTimeBox;
import ru.novaris.novoscan.client.resources.ImplConstants;
import ru.novaris.novoscan.client.resources.ImplConstantsGWT;
import ru.novaris.novoscan.domain.DataSensor;
import ru.novaris.novoscan.domain.DataSensorLast;

import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.user.client.Cookies;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.DialogBox;
import com.google.gwt.user.client.ui.DockLayoutPanel;
import com.google.gwt.user.client.ui.PushButton;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.SimplePanel;
import com.google.gwt.user.client.ui.Widget;
import com.google.gwt.user.client.ui.HTML;

/**
 * @author kur
 * 
 */
public class MapTrackData extends DialogBox implements ImplConstantsGWT,
		ImplConstants {
	private Date dateBegin;
	private Date dateEnd;
	private int format = FORMAT_OPENSTREET;
	private static MapTrackDataUiBinder uiBinder = GWT
			.create(MapTrackDataUiBinder.class);
	@UiField
	SimplePanel boxDateTimeBegin;
	@UiField
	SimplePanel boxDateTimeEnd;
	@UiField
	PushButton cancel;
	@UiField
	PushButton ok;
	@UiField
	PushButton upload;
	@UiField
	static HTML objInfo;
	@UiField
	static HTML objName;
	@UiField
	PushButton clear;
	@UiField
	DockLayoutPanel dockLayoutPanel;
	@UiField
	CheckBox speed;

	private List<DataSensor> dataSensor;

	public List<DataSensor> getDataSensor() {
		return dataSensor;
	}

	private long dasnUid;
	private Novoscan entryPoint;
	private DateTimeBox dateTimeBegin;
	private DateTimeBox dateTimeEnd;
	private DataSensorLast dataSensorLast;
	private final DateTimeFormat fmt = DateTimeFormat
			.getFormat(JAVA_DATE_FORMAT);

	interface MapTrackDataUiBinder extends UiBinder<Widget, MapTrackData> {
	}

	/**
	 * Because this class has a default constructor, it can be used as a binder
	 * template. In other words, it can be used in other *.ui.xml files as
	 * follows: <ui:UiBinder xmlns:ui="urn:ui:com.google.gwt.uibinder"
	 * xmlns:g="urn:import:**user's package**">
	 * <g:**UserClassName**>Hello!</g:**UserClassName> </ui:UiBinder> Note that
	 * depending on the widget that is used, it may be necessary to implement
	 * HasHTML instead of HasText.
	 * 
	 * @param listener
	 */
	public MapTrackData(Novoscan entryPoint) {
		super();
		this.entryPoint = entryPoint;
		this.addStyleDependentName("foreground");
		setWidget(uiBinder.createAndBindUi(this));
		objInfo.setHTML(constants.TrackInfo());
		dasnUid = entryPoint.getUid();
		ok.setText(constants.Apply());
		cancel.setText(constants.Cancel());
		clear.setText(constants.Clear());
		upload.setText(constants.Upload());
		speed.setText(constants.Speed());
		addListener();
		RootPanel.getBodyElement().getStyle().setProperty("cursor", "default");
	}

	public void addListener() {
		ClickHandler listenerOK = new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				dateBegin = dateTimeBegin.getDate();
				dateEnd = dateTimeEnd.getDate();
				if (dateBegin == null || dateEnd == null
						|| dateEnd.before(dateBegin)) {
					new DbMessage(MessageType.ERROR,
							"Неверно введены даты. Для выполнения запроса введите интервал дат.");
				} else {
					entryPoint.clearTrack();
					format = FORMAT_OPENSTREET;
					loadDataSensor(dasnUid, dateBegin, dateEnd);
					entryPoint.setTrackDataBegin(dateBegin);
					entryPoint.setTrackDataEnd(dateEnd);
					entryPoint.setUid(dasnUid);
					entryPoint.setSpeed(speed.getValue());
				}
			}

		};
		ok.addClickHandler(listenerOK);
		ClickHandler listenerClear = new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				clearTrack();
			}

		};
		clear.addClickHandler(listenerClear);
		ClickHandler listenerCancel = new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				clearTrack();
				removeFromParent();
			}

		};
		cancel.addClickHandler(listenerCancel);
		ClickHandler createKml = new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {
				dateBegin = dateTimeBegin.getDate();
				dateEnd = dateTimeEnd.getDate();
				if (dateBegin == null || dateEnd == null
						|| dateEnd.before(dateBegin)) {
					new DbMessage(MessageType.ERROR,
							"Неверно введены даты. Для выполнения запроса введите интервал дат.");
				} else {
					format = FORMAT_GPX;
					loadDataSensor(dasnUid, dateBegin, dateEnd);
					entryPoint.setTrackDataBegin(dateBegin);
					entryPoint.setTrackDataEnd(dateEnd);
					entryPoint.setUid(dasnUid);
					final String reportFile = "TRACK_DATA_" + dasnUid;
					final RequestBuilder requestBuilder = new RequestBuilder(
							RequestBuilder.POST, GWT.getModuleBaseURL()
									+ REPORT_SERVER_SERVLET);
					requestBuilder.setHeader("Content-type",
							"application/x-www-form-urlencoded");
					final StringBuffer postData = new StringBuffer();
					postData.append(FORMAT_FILE)
							.append("=")
							.append(FORMATS[format])
							.append("&")
							.append("spmd_uid")
							.append("=")
							.append(Long.toString(dasnUid))
							.append("&")
							.append(COOKIE_TIMEZONE_OFFSET)
							.append("=")
							.append(URL.encode(Cookies
									.getCookie(COOKIE_TIMEZONE_OFFSET)))
							.append("&").append(REPORT_FILE).append("=")
							.append(reportFile).append("&").append("date_beg")
							.append("=").append(fmt.format(dateBegin))
							.append("&").append("date_end").append("=")
							.append(fmt.format(dateEnd));
					requestBuilder.setRequestData(postData.toString());
					requestBuilder.setCallback(new RequestCallback() {
						@Override
						public void onError(Request request, Throwable exception) {
							showDefaultCursor();
							new DbMessage(MessageType.ERROR,
									"Ошибка формирования отчёта: "
											+ exception.getMessage());
						}

						@Override
						public void onResponseReceived(Request request,
								Response response) {
							showDefaultCursor();
							if (response.getStatusCode() == Response.SC_OK) {
								Window.open(
										GWT.getHostPageBaseURL()
												+ response.getText(),
										reportFile, "");
							} else {
								new DbMessage(MessageType.ERROR,
										"Ошибка формирования отчёта: "
												+ response.getStatusCode());
							}

						}
					});
					try {
						showWaitCursor();
						requestBuilder.send();
					} catch (RequestException ex) {
						showDefaultCursor();
						ex.printStackTrace();
					}

				}
			}

		};
		upload.addClickHandler(createKml);
	}

	private void loadDataSensor(long dasnUid, Date begDate, Date endDate) {
		AsyncCallback<List<DataSensor>> callback = new AsyncCallback<List<DataSensor>>() {
			public void onFailure(Throwable caught) {
				RootPanel.getBodyElement().getStyle()
						.setProperty("cursor", "wait");
				new DbMessage(MessageType.ERROR, caught.getMessage());
			}

			public void onSuccess(List<DataSensor> result) {
				setDataSensor(result);
				if (format == FORMAT_OPENSTREET) {
					viewTrack();
				}
				if (result.size() > 0) {
					objInfo.setText(result.get(result.size() - 1).getDasnXml());
				} else {
					objInfo.setText("Нет данных!");
				}
				RootPanel.getBodyElement().getStyle()
						.setProperty("cursor", "default");
			}
		};
		RootPanel.getBodyElement().getStyle().setProperty("cursor", "wait");
		rpcObject.getDataSensor(dasnUid, begDate, endDate, callback);
	}

	protected void viewKml() {
		// TODO Auto-generated method stub

	}

	public void setDataSensor(List<DataSensor> result) {
		dataSensor = result;
		entryPoint.setTrackData(dataSensor);
	}

	public void viewTrack() {
		entryPoint.addTrack();
		entryPoint.refreshMapData();
	}

	public void clearTrack() {
		entryPoint.removeTrackData();
		entryPoint.clearTrack();
	}

	public long getDasnUid() {
		return dasnUid;
	}

	@SuppressWarnings("deprecation")
	public void setDasnData(DataSensorLast dataSensorLast) {
		this.dataSensorLast = dataSensorLast;
		this.dasnUid = dataSensorLast.getDaslUid();
		if (this.dasnUid != entryPoint.getUid()) {
			this.dateBegin = (Date) this.dataSensorLast.getDaslDatetime()
					.clone();
			this.dateBegin.setHours(0);
			this.dateBegin.setMinutes(0);
			this.dateBegin.setSeconds(0);
			entryPoint.setTrackDataBegin(this.dateBegin);
			this.dateEnd = (Date) this.dataSensorLast.getDaslDatetime().clone();
			this.dateEnd.setHours(23);
			this.dateEnd.setMinutes(59);
			this.dateEnd.setSeconds(59);
			entryPoint.setTrackDataEnd(this.dateEnd);
		}
		this.dateBegin = entryPoint.getTrackDataBegin();
		this.dateEnd = entryPoint.getTrackDataEnd();
		boxDateTimeBegin.clear();
		boxDateTimeEnd.clear();
		objInfo.setHTML("");
		dateTimeBegin = new DateTimeBox(dateBegin);
		dateTimeEnd = new DateTimeBox(dateEnd);
		boxDateTimeBegin.add(dateTimeBegin.getDateTimeBox());
		boxDateTimeEnd.add(dateTimeEnd.getDateTimeBox());
	}

	public void setTitle(String info) {
		dockLayoutPanel.setTitle(info);
		objName.setHTML(info);
	}

	private static void showWaitCursor() {
		RootPanel.getBodyElement().getStyle().setProperty("cursor", "wait");
	}

	private static void showDefaultCursor() {
		RootPanel.getBodyElement().getStyle().setProperty("cursor", "default");
	}

}