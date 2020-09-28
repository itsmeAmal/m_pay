<%@page import="com.caller.*"%>
<%@page import="com.itextpdf.text.pdf.ColumnText"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="java.awt.Canvas"%>
<%@page import="com.itextpdf.text.pdf.PdfFormXObject"%>
<%@page import="com.itextpdf.text.pdf.PdfDocument"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="java.net.URL"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfStamper"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="com.caller.Callers"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.itextpdf.text.RectangleReadOnly"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>



<%!
Callers callobj = new Callers();
List<TransactionAll> Transobj = null;

%>


<% 
System.out.println("sssssssssssssssssddddddddddddddddddddddddddddddd");
String action = "" + request.getParameter("action");
//String reportType = ""+request.getParameter("reportType");
String transid = "" + request.getParameter("transid"); 
String accountno = "" + request.getParameter("accno"); 
String status = "" + request.getParameter("status");
String type = "" + request.getParameter("type"); 
String date_start = "" + request.getParameter("datestart"); 
String date_end = "" + request.getParameter("dateend"); 
String min_amount = "" + request.getParameter("min"); 
String max_amount = "" + request.getParameter("max"); 


System.out.println("action : " + action+"|||||"+accountno+"|||||"+status+"|||||"+type+"|||||"+date_start+"|||||"+date_end+"|||||"+min_amount+"|||||"+max_amount+"|||||"+transid);


if(transid.equals("empt") && accountno.equals("empt") && type.equals("empt") && status.equals("empt") && date_start.equals("empt") && date_end.equals("empt") && min_amount.equals("empt") && max_amount.equals("empt")){
	Transobj = callobj.searchAll(date_start, date_end, accountno, status, type, min_amount, max_amount);
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

	Document document = new Document(new RectangleReadOnly(842,595));
    try
    {
    	
    	
    	
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("H:\\testpdf.pdf"));
        document.open();
        
        String heading1 = "BEET"; 
        String heading2 = "TRANSACTION SUMMARY REPORT - ALL TRANSACTIONS";
        String heading3 = "\n\n\n";
        
        document.add(new Paragraph(heading1+"\n"+heading2+"\n"+heading3));
        
        
        
        PdfPTable table = new PdfPTable(9); // 3 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table
 		
        
        //Set Column widths
        float[] columnWidths = {0.5f, 1f, 1f, 1.3f, 1.3f, 1f, 0.75f, 1.4f, 0.75f};
        table.setWidths(columnWidths);
 
        PdfPCell cell1 = new PdfPCell(new Paragraph("No"));
        cell1.setBorderColor(BaseColor.BLACK);
        cell1.setPaddingLeft(2);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
       
               
 
        PdfPCell cell2 = new PdfPCell(new Paragraph("Transaction ID"));
        cell2.setBorderColor(BaseColor.BLACK);
        cell2.setPaddingLeft(2);
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        PdfPCell cell3 = new PdfPCell(new Paragraph("Date"));
        cell3.setBorderColor(BaseColor.BLACK);
        cell3.setPaddingLeft(2);
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        PdfPCell cell4 = new PdfPCell(new Paragraph("Account From"));
        cell4.setBorderColor(BaseColor.BLACK);
        cell4.setPaddingLeft(2);
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        PdfPCell cell5 = new PdfPCell(new Paragraph("Account To"));
        cell5.setBorderColor(BaseColor.BLACK);
        cell5.setPaddingLeft(2);
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
               
        
        PdfPCell cell6 = new PdfPCell(new Paragraph("Transaction Type"));
        cell6.setBorderColor(BaseColor.BLACK);
        cell6.setPaddingLeft(2);
        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        
        PdfPCell cell7 = new PdfPCell(new Paragraph("Entry"));
        cell7.setBorderColor(BaseColor.BLACK);
        cell7.setPaddingLeft(2);
        cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        
        PdfPCell cell8 = new PdfPCell(new Paragraph("Amount"));
        cell8.setBorderColor(BaseColor.BLACK);
        cell8.setPaddingLeft(2);
        cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell8.setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        
        PdfPCell cell9 = new PdfPCell(new Paragraph("Status"));
        cell9.setBorderColor(BaseColor.BLACK);
        cell9.setPaddingLeft(2);
        cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell9.setVerticalAlignment(Element.ALIGN_MIDDLE); 
 
        
        
        //To avoid having the cell border and the content overlap, if you are having thick cell borders
        //cell1.setUserBorderPadding(true);
        //cell2.setUserBorderPadding(true);
        //cell3.setUserBorderPadding(true);
 
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell5);
        table.addCell(cell6);
        table.addCell(cell7);
        table.addCell(cell8);
        table.addCell(cell9);
        
        
        
table.setHeaderRows(0);

System.out.println("!!!!!!!!!");

System.out.println("ssssss"+Transobj.size());

for (int i = 0; i < Transobj.size(); i++) {
	String acccombine = Transobj.get(i).getUserAccNo();
	
	String[] accnoArr= acccombine.split(",");
	String accto="";
	String accfrom="";
	
	if(accnoArr.length==2){
		accto=accnoArr[0];
		accfrom=accnoArr[1];
	}
	
	if(accnoArr.length==1){
		accto=accnoArr[0];
		accfrom=accnoArr[0];
	}
	
	
	String date = Transobj.get(i).getDate();
	String description = Transobj.get(i).getDescription();
	String entry = Transobj.get(i).getEntry();
	String Status = Transobj.get(i).getStatus();
	String acc_to = accto;
	String acc_from = accfrom;
	String id = String.valueOf(i+1);
	String Tid = Transobj.get(i).gettId();
	String amount = String.valueOf(Transobj.get(i).getAmount());
	Double numParsed = Double.parseDouble(amount);
	String numString = String.format("%,.2f", numParsed);
	
	//System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+numString);
	//String balance = String.valueOf(Transobj.get(i).getBalanceAmount());
	
	
	table.addCell(id);
	table.addCell(Tid);
	table.addCell(date);
	table.addCell(acc_from);
	table.addCell(acc_to);
	table.addCell(description);       
    table.addCell(entry);
    table.addCell(numString);
    table.addCell(Status);

}
    


	
	   
   
	
/*String x="100";

		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);
		table.addCell(x);*/
		           
 
        document.add(table);
 
		
		 
	    //Add Image
	   /*  Image image1 = Image.getInstance("download.png");
	    //Fixed Positioning
	    image1.setAbsolutePosition(40f, 10f);
	    //Scale to new height and new width of image
	    image1.scaleAbsolute(120, 60);
	    //Add to document
	    document.add(image1); */
	 
	    System.out.println("aaaaaa"+writer.getPageNumber());
	    
	    for(int i=0;i<writer.getPageNumber();i++){
	    
	    PdfContentByte canvas = writer.getDirectContentUnder();
	    Phrase watermark = new Phrase("Mobi0s Pvt Ltd", new Font(FontFamily.TIMES_ROMAN, 80, Font.NORMAL, BaseColor.LIGHT_GRAY));
	    ColumnText.showTextAligned(canvas, Element.ALIGN_CENTER, watermark, 500, 350, 45);
	    Font font = new Font(FontFamily.TIMES_ROMAN, 20, Font.NORMAL, BaseColor.BLACK);
	    }
	    
	  
		
        document.close();
        writer.close();
        
        
	 
   	    
        
    } catch (Exception e)
    {
        e.printStackTrace();
    }
    
    
    System.out.println("-----------------Downloaded Pdf-----------------");
    
    
	
    
}

%>