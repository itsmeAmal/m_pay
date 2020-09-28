<%@page import="com.caller.controller.MainController"%>
<%@page import="com.caller.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.util.Set"%>
<%@page import="org.apache.poi.ss.usermodel.FillPatternType"%>
<%@page import="org.apache.poi.ss.usermodel.IndexedColors"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCellStyle"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.UUID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>


<%!
Callers callobj = new Callers();
List<TransactionAll> Transobj = null;

%>

<%

//System.out.println("sssssssssssssssssddddddddddddddddddddddddddddddd");
String action = "" + request.getParameter("action");
String transid = "" + request.getParameter("transid").replace(" ", ""); 
String accountno = "" + request.getParameter("accno"); 
String status = "" + request.getParameter("status");
String type = "" + request.getParameter("type"); 
String date_start = "" + request.getParameter("datestart"); 
String date_end = "" + request.getParameter("dateend"); 
String min_amount = "" + request.getParameter("min"); 
String max_amount = "" + request.getParameter("max"); 

System.out.println("action : " + action+"|||||"+accountno+"|||||"+status+"|||||"+type+"|||||"+date_start+"|||||"+date_end+"|||||"+min_amount+"|||||"+max_amount+"|||||"+transid);

//System.out.println(">>> ACTION >>> : " + action);

MainController mc = new MainController();

	if(transid.equals("empt") && accountno.equals("empt") && type.equals("empt") && status.equals("empt") && date_start.equals("empt") && date_end.equals("empt") && min_amount.equals("empt") && max_amount.equals("empt")){
		Transobj = callobj.getDetails();
		System.out.println("sssssssssssssssss111111111111"+Transobj.size());
		System.out.println("-----------------Downloading All Transaction Pdf-----------------");	
		}
	else if(!transid.equals("empt")){

		TransactionAll tr = new TransactionAll();
		tr = callobj.searchByTrnsactionId(transid);
		Transobj = java.util.Arrays.asList(tr);
		System.out.println("sssssssssssssssss2222222222222"+Transobj.size());
		System.out.println("-----------------Downloading Transaction by id Pdf-----------------");	
	
	}	
	else{
		Transobj = callobj.searchAll(date_start, date_end, accountno, status, type, min_amount, max_amount);
		System.out.println("sssssssssssssssss222222222222222"+Transobj.size());
		System.out.println("-----------------Downloading Customized Transaction Pdf-----------------");	
		}
	
	
		
		if (action.equals("getDownload")) {

			String Heading = "";
			String downloadFileName = "";
			String display_error = "0";

				String rPath = request.getServletContext().getRealPath("");
				//System.out.println("RRRR___RRRPATH : " + rPath);
				rPath = rPath.split("/CRS")[0];
				System.out.println("RRRR___RRRPATH : " + rPath);
				
				String fileName = "H:/sample.xlsx";

				downloadFileName = "http://localhost:8080/Beet_Frontend/sample.xlsx";
				System.out.println("Created file name = " + fileName);
				
				//Blank workbook
				XSSFWorkbook workbook = new XSSFWorkbook();
				//Create a blank sheet
				XSSFSheet sheet = workbook.createSheet("Textware Infortell Customers " + Heading + "Report");

				XSSFCellStyle my_style = workbook.createCellStyle();

				Font font = workbook.createFont();
				font.setBoldweight(Font.BOLDWEIGHT_BOLD);
				font.setFontName("Calibri");
				font.setFontHeightInPoints((short) 11);
				font.setColor(IndexedColors.WHITE.getIndex());
				my_style.setFont(font);

				my_style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
				my_style.setBorderRight(XSSFCellStyle.BORDER_THIN);
				my_style.setBorderTop(XSSFCellStyle.BORDER_THIN);
				my_style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
				my_style.setBottomBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style.setRightBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style.setTopBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style.setLeftBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				my_style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				my_style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
				my_style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

				XSSFCellStyle my_style1 = workbook.createCellStyle();
				Font font1 = workbook.createFont();
				font1.setFontName("Calibri");
				font1.setFontHeightInPoints((short) 11);
				my_style1.setFont(font1);

				my_style1.setBorderLeft(XSSFCellStyle.BORDER_THIN);
				my_style1.setBorderRight(XSSFCellStyle.BORDER_THIN);
				my_style1.setBorderTop(XSSFCellStyle.BORDER_THIN);
				my_style1.setBorderBottom(XSSFCellStyle.BORDER_THIN);
				my_style1.setBottomBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style1.setRightBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style1.setTopBorderColor(IndexedColors.GREY_50_PERCENT.index);
				my_style1.setLeftBorderColor(IndexedColors.GREY_50_PERCENT.index);

				Map<String, Object[]> data = new TreeMap<String, Object[]>();
								
					
					data.put("1", new Object[] {  "ID","Transaction Id","Date","User Account No", "Transaction Types", "Entry", "Amount", "Status", "Balance Amount" });

					for (int i = 0; i < Transobj.size(); i++) {
						String amount = String.valueOf(Transobj.get(i).getAmount());
						String balance = String.valueOf(Transobj.get(i).getBalanceAmount());
						int no = i+1;
						data.put("" + (i + 2),
								new Object[] { 		
										no,
										Transobj.get(i).gettId(),
										Transobj.get(i).getDate(),
										Transobj.get(i).getUserAccNo(),
										Transobj.get(i).getDescription(),
										Transobj.get(i).getEntry(),
										amount,
										Transobj.get(i).getStatus(),
										balance
															
										
						});
						
					}				
				
				//Iterate over data and write to sheet
				Set<String> keyset = data.keySet();
				int rownum = 0;
				for (String key : keyset) {
					Row row = sheet.createRow(rownum++);
					Object[] objArr = data.get(key);
					int cellnum = 0;
					for (Object obj : objArr) {
						if (rownum == 1) {
							// System.out.println("row ");
							Cell cell = row.createCell(cellnum++);
							// System.out.println("cellnum : "+cellnum);
							if (obj instanceof String) {
								cell.setCellValue((String) obj);
								cell.setCellStyle(my_style);

							} else if (obj instanceof Integer) {
								cell.setCellValue((Integer) obj);
								//cell.setCellStyle(my_style);
							}
						} else {

							Cell cell = row.createCell(cellnum++);
							// System.out.println("cellnum : ");
							if (obj instanceof String) {
								cell.setCellValue((String) obj);
								cell.setCellStyle(my_style1);

							} else if (obj instanceof Integer) {
								cell.setCellValue((Integer) obj);
							}
						}

					}
				}
				for (int columnIndex = 0; columnIndex < 9; columnIndex++) {//set auto width
					sheet.autoSizeColumn(columnIndex);
				}

				//Iterate over data and write to sheet
				try {
					//Write the workbook in file system
					 File file = new File(fileName);
					 file.setWritable(true);
					 file.setExecutable(true);
					 file.setReadable(true);
					//FileOutputStream out1 = new FileOutputStream(new File(fileName));
					FileOutputStream out1 = new FileOutputStream(file);
					
					workbook.write(out1);
					out1.close();
					System.out.println("xlsx written successfully on disk.");
					//LogUtil.getLog("Event").debug(logData + ",ReportDownload,status:sucess,fileType:"+fileType+",userRole:"+userRole+",userStatus:"+userStatus+",startDate:"+datefrom+",endDate:"+dateTo+",downloadedBy:"+userid);

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception when writing to the file : " + e.toString());
					//LogUtil.getLog("Error").debug(logData + ",ReportDownload,status:downloadErr,fileType:"+fileType+",userRole:"+userRole+",userStatus:"+userStatus+",startDate:"+datefrom+",endDate:"+dateTo+",downloadedBy:"+userid);
				}
			
			
			

			System.out.println(" ##### DOWNLOAD FILE ##### " + downloadFileName);
			out.print(downloadFileName + "," + display_error);
		}





%>