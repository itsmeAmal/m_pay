package com.caller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;


import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;


public class Callers {
	
//Get all transactions from table transactions
public List<TransactionAll> getDetails() throws IOException{
		
		List<TransactionAll> responseModel = null;
		
		String line;
		
		  try {

			URL url = new URL("http://213.136.79.138:8092/api/beet/alltransactions");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));
			
			StringBuilder content = new StringBuilder();
			
			while ((line = br.readLine()) != null) {
				content.append(line);
				content.append("\n");
			}
			
			String response = "";
			response = content.toString();
			
			String output;
			System.out.println("Output from Server .... \n");
			/*while ((output = br.readLine()) != null) {
				System.out.println(output);
			}*/
			
			ObjectMapper mapper = new ObjectMapper();			
			responseModel = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
			System.out.println("asdas");
			
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {
		        throw new RuntimeException(e);
		  }
		  System.out.println("dfdsf"+responseModel);
		  return responseModel;
		}
	
//Get all transactions from table display transactions
public List<TransactionSuccess> getAllDetails() throws IOException{
	
	List<TransactionSuccess> responseModel1 = null;
	
	String line;
	
	  try {

		URL url = new URL("http://213.136.79.138:8092/api/beet/alltransactiondetails");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel1 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel1);
	  return responseModel1;
	}


//transaction details for a date range from details table
public List<TransactionSuccess> getMonthly(String date1,String date2) throws IOException{
	
	List<TransactionSuccess> responseModel2 = null;
	
	String line;
	
	  try {
		
		String api_string = "http://213.136.79.138:8092/api/beet/details/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date1);
		str.append("_00:00:00/");
		str.append(date2);
		str.append("_23:59:59");
		
		String fullurl = str.toString();
			System.out.println("0000000000000000000"+fullurl); 
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel2 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel2);
	  return responseModel2;
	}

//transaction details for a date from details table
public  List<TransactionSuccess> getDaily(String date) throws IOException{

	List<TransactionSuccess> responseModel3 = null;

String line;

try {
	String api_string = "http://213.136.79.138:8092/api/beet/details/";
	StringBuilder str = new StringBuilder();
	str.append(api_string);
	str.append(date);
	str.append("_00:00:00/");
	str.append(date);
	str.append("_23:59:59");
	String fullurl = str.toString();
	System.out.println("******************"+fullurl);
	
	URL url = new URL(fullurl);
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
	conn.setRequestProperty("Accept", "application/json");

	if (conn.getResponseCode() != 200) {
		throw new RuntimeException("Failed : HTTP error code : "
				+ conn.getResponseCode());
	}

	BufferedReader br = new BufferedReader(new InputStreamReader(
		(conn.getInputStream())));
	
	StringBuilder content = new StringBuilder();
	
	while ((line = br.readLine()) != null) {
		content.append(line);
		content.append("\n");
	}
	
	String response = "";
	response = content.toString();
	
	String output;
	System.out.println("Output from Server .... \n");
	/*while ((output = br.readLine()) != null) {
		System.out.println(output);
	}*/
	
	ObjectMapper mapper = new ObjectMapper();			
	responseModel3 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
	System.out.println("asdas");
	
	conn.disconnect();

} catch (MalformedURLException e) {

	e.printStackTrace();

} catch (IOException e) {
    throw new RuntimeException(e);
}
System.out.println("dfdsf"+responseModel3);
return responseModel3;
}

//Daily transactions from transactions table
public List<TransactionAll> getDailyStatus(String date) throws IOException{

	List<TransactionAll> responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactions/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date);
		str.append("_00:00:00/");
		str.append(date);
		str.append("_23:59:59");
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

//get all wallet details
public  List<Wallet> getWalletDetails() throws IOException{
	
	List<Wallet> responseModel = null;
	
	String line;
	
	  try {

		URL url = new URL("http://213.136.79.138:8092/api/beet/totalwalletdetails");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<Wallet>>(){});
		System.out.println("asdas");
		
		
		
	
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}

//Get all profile details
public  List<ProfileDistributionN> getAllProfileDetails() throws IOException{
	
	List<ProfileDistributionN> responseModel = null;
	
	String line;
	
	  try {

		URL url = new URL("http://213.136.79.138:8092/api/beet/allprofiles");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<ProfileDistributionN>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}

//procedure call for DisplayTableData - account from account to 

public  List<DataDisplay> getTableData(int limit) throws IOException{
	
	List<DataDisplay> responseModel = null;
	
	String line;
	
	  try {

		URL api_string = new URL("http://213.136.79.138:8092/api/beet/datadisplay/");
		
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(limit);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<DataDisplay>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
}



//procedure call for DisplayTableDataByAccno - account from account to for a user using the accno

public  List<DataDisplay> getTableDataByAccno(String accno,int limit) throws IOException{
	
	List<DataDisplay> responseModel = null;
	
	String line;
	
	  try {

		URL api_string = new URL("http://213.136.79.138:8092/api/beet/datadisplaybyaccno/");
		
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		str.append("/");
		str.append(limit);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<DataDisplay>>(){});
		System.out.println("asdas");
		//System.out.println("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"+fullurl);
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  
	  return responseModel;
	}


	
/*/Admin dashboard */


//get user type counts for Superagent,Distributor,Agents

public  List<ProfileDistributionN> getProfileDetailsByAccount(String accno) throws IOException{
	
	List<ProfileDistributionN> responseModel2 = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet//profiles/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel2 = mapper.readValue(response, new TypeReference<List<ProfileDistributionN>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel2);
	  return responseModel2;
	}

//get all transactions for Superagent/Distributor/Agents by accno from display transactions table
public  List<TransactionSuccess> getTransByAccount(String accno) throws IOException{
	
	List<TransactionSuccess> responseModel2 = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/details/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append("/");
		str.append(accno);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel2 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel2);
	  return responseModel2;
	}

//get  transactions for Superagent,Distributor,Agents by accno and date range(Monthly) from display transactions table
public  List<TransactionSuccess> getTransByAccandDate(String date1,String date2,String accno) throws IOException{
	
	List<TransactionSuccess> responseModel2 = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/details/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date1);
		str.append("_00:00:00/");
		str.append(date2);
		str.append("_23:59:59/");
		str.append(accno);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel2 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel2);
	  return responseModel2;
	}

// get transaction details for superagent,distributor,agent,suscriber for a date from display trans table
public  List<TransactionSuccess> getDailyByAccno(String accno, String date) throws IOException{

	List<TransactionSuccess> responseModel3 = null;

String line;

try {
	String api_string = "http://213.136.79.138:8092/api/beet/details/";
	StringBuilder str = new StringBuilder();
	str.append(api_string);
	str.append(date);
	str.append("_00:00:00/");
	str.append(date);
	str.append("_23:59:59");
	str.append("/");
	str.append(accno);
	String fullurl = str.toString();
	System.out.println("******************"+fullurl);
	
	URL url = new URL(fullurl);
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	conn.setRequestMethod("GET");
	conn.setRequestProperty("Accept", "application/json");

	if (conn.getResponseCode() != 200) {
		throw new RuntimeException("Failed : HTTP error code : "
				+ conn.getResponseCode());
	}

	BufferedReader br = new BufferedReader(new InputStreamReader(
		(conn.getInputStream())));
	
	StringBuilder content = new StringBuilder();
	
	while ((line = br.readLine()) != null) {
		content.append(line);
		content.append("\n");
	}
	
	String response = "";
	response = content.toString();
	
	String output;
	System.out.println("Output from Server .... \n");
	/*while ((output = br.readLine()) != null) {
		System.out.println(output);
	}*/
	
	ObjectMapper mapper = new ObjectMapper();			
	responseModel3 = mapper.readValue(response, new TypeReference<List<TransactionSuccess>>(){});
	System.out.println("asdas");
	
	conn.disconnect();

} catch (MalformedURLException e) {

	e.printStackTrace();

} catch (IOException e) {
  throw new RuntimeException(e);
}
System.out.println("dfdsf"+responseModel3);
return responseModel3;
}

//get daily transactions for acc no from transactions table
public List<TransactionAll> getDailyStatusByAccno(String date,String accno) throws IOException{
	
	List<TransactionAll> responseModel = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactions/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date);
		str.append("_00:00:00/");
		str.append(date);
		str.append("_23:59:59");
		str.append("/");
		str.append(accno);
		String fullurl = str.toString();
		System.out.println("******************"+fullurl);

		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}

//get all transactions by a account no from transactions table
public List<TransactionAll> getDetailsByAccNo(String accno) throws IOException{
	
	List<TransactionAll> responseModel = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactions/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append("/");
		str.append(accno);
		String fullurl = str.toString();  
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}


//get all wallet details by accno
public  List<Wallet> getWalletDetailsByAccno(String accno) throws IOException{
	
	List<Wallet> responseModel = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/walletdetails/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append("/");
		str.append(accno);
		String fullurl = str.toString(); 
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<Wallet>>(){});
		System.out.println("asdas");
		
		
		
	
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}

//search all transactions by account number
public List<TransactionAll> search(String date1,String date2,String accno) throws IOException{

	List<TransactionAll> responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactions/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date1);
		str.append("_00:00:00/");
		str.append(date2);
		str.append("_23:59:59/");
		str.append(accno);
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

// serch tansactions all by selected type
public List<TransactionAll> searchAll(String date1,String date2,String accno,String status,String transTypeId, String amountmin, String amountmax) throws IOException{

	
	List<TransactionAll> responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactions/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(date1);
		str.append("/");
		str.append(date2);
		str.append("/");
		str.append(accno);
		str.append("/");
		str.append(status);
		str.append("/");
		str.append(transTypeId);
		str.append("/");
		str.append(amountmin);
		str.append("/");
		str.append(amountmax);
		
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		System.out.println("yyyyyyyyyyyyy"+url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<List<TransactionAll>>(){});
		
		System.out.println("printing search list results*******"+responseModel3);
		
		/*for(int i =0; i<responseModel3.size(); i++) {
			
		}*/
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

//serach transaction by trans id
public TransactionAll searchByTrnsactionId(String tid) throws IOException{

	TransactionAll responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/transactionsbyid/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(tid);
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<TransactionAll>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

//search user by account number
public  ProfileDistributionN searchByMobileNumber(String mobileno) throws IOException{

	ProfileDistributionN responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profile/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(mobileno);
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<ProfileDistributionN>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////
//get user details by account number
public  ProfileDistributionN getuserDetailsByAccount(String accno) throws IOException{

	ProfileDistributionN responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profilebyaccno/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<ProfileDistributionN>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}


//save the update profile information 
public  String updateProfileInfo(ProfileUpdate prof) throws IOException{

	String responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profileupdate";
		
		
		URL url = new URL(api_string);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
	
		JSONObject jsonInput = new JSONObject();
		
		jsonInput.put("accNo", prof.getAccNo());
		jsonInput.put("mobileNumber", prof.getMobileNumber());
		jsonInput.put("name", prof.getName());
		jsonInput.put("nic", prof.getNic());
		jsonInput.put("dob", prof.getDob());
		jsonInput.put("gender",prof.getGender());
		jsonInput.put("address", prof.getAddress());
		jsonInput.put("nominee", prof.getNominee());
		jsonInput.put("nomineeNic", prof.getNomineeNic());
		jsonInput.put("updatedDate", prof.getUpdatedDate());
		jsonInput.put("newStatus", prof.getNewStatus());
		jsonInput.put("requestStatus", prof.getRequestStatus());
		jsonInput.put("requestSendTo", prof.getRequestSendTo());
		jsonInput.put("preStatus", prof.getPreStatus());
		jsonInput.put("notes", prof.getNotes());
		
		try(OutputStream os = conn.getOutputStream()) {
			String jsonInputString= jsonInput.toString();
		    byte[] input = jsonInputString.getBytes("utf-8");
		    os.write(input, 0, input.length);           
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; while ((responseLine =
			  br.readLine()) != null) { response.append(responseLine.trim()); }
			  System.out.println(response.toString()); responseModel3=response.toString();
			 }catch(Exception ex) { System.out.println("mmmmmmmmmmmmm"+ex); }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

//get updated details using account number
public  List<ProfileUpdate> getProfileUpdateDetailsByAccno(String accno) throws IOException{

	List<ProfileUpdate> responseModel3 = null;
	System.out.println(accno);
	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profileupdates/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<List<ProfileUpdate>>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	System.out.println(responseModel3.size() +"fffffffffffffffffffff");
	return responseModel3;
}


//update the original profile distribution table after approved the user by  account number
public  String updateProfileInfoOriginal(ProfileDistributionN prof, String accno) throws IOException{
	
	String responseModel3 = null;

	String line;

	
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profileupdateOriginal/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
	
		JSONObject jsonInput = new JSONObject();
		
		jsonInput.put("accNo", prof.getAccNo());
		jsonInput.put("mobileNumber", prof.getMobileNumber());
		jsonInput.put("name", prof.getName());
		jsonInput.put("nic", prof.getNic());
		jsonInput.put("dob", prof.getDob());
		jsonInput.put("gender",prof.getGender());
		jsonInput.put("address", prof.getAddress());
		jsonInput.put("nominee", prof.getNominee());
		jsonInput.put("nomineeNic", prof.getNomineeNic());
		jsonInput.put("statusCode", prof.getStatusCode());

		try(OutputStream os = conn.getOutputStream()) {
			String jsonInputString= jsonInput.toString();
		    byte[] input = jsonInputString.getBytes("utf-8");
		    os.write(input, 0, input.length);           
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; 
				  while ((responseLine = br.readLine()) != null) {
					  response.append(responseLine.trim());
					  }
				  
			  System.out.println(response.toString()); 
			  responseModel3=response.toString();
			 }catch(Exception ex) { 
				 System.out.println("mmmmmmmmmmmmm"+ex);
				 }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	System.out.println("put function from caller class working..........");
	return responseModel3;
}

//update request status of the user by account number approved or not
public  String updaterequestStatus(ProfileUpdate prof, String accno) throws IOException{
	
	String responseModel3 = null;

	String line;

	
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/profilestatusupdates/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
	
		JSONObject jsonInput = new JSONObject();
		
		jsonInput.put("accNo", prof.getAccNo());
		jsonInput.put("requestStatus", prof.getRequestStatus());
	

		try(OutputStream os = conn.getOutputStream()) {
			String jsonInputString= jsonInput.toString();
		    byte[] input = jsonInputString.getBytes("utf-8");
		    os.write(input, 0, input.length);           
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; 
				  while ((responseLine = br.readLine()) != null) {
					  response.append(responseLine.trim());
					  }
				  
			  System.out.println(response.toString()); 
			  responseModel3=response.toString();
			 }catch(Exception ex) { 
				 System.out.println("mmmmmmmmmmmmm"+ex);
				 }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	System.out.println("put function from caller class working..........");
	return responseModel3;
}

//update fee rules table for selected type and fee amount limit
public  String updatefeesRules(double feesRates,double fees , int transtype , double amountmin, double amountmax) throws IOException{
	
	String responseModel3 = null;

	String line;

	
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/feesrules/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(feesRates);
		str.append("/");
		str.append(fees);
		str.append("/");
		str.append(transtype);
		str.append("/");
		str.append(amountmin);
		str.append("/");
		str.append(amountmax);
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; 
				  while ((responseLine = br.readLine()) != null) {
					  response.append(responseLine.trim());
					  }
				  
			  System.out.println(response.toString()); 
			  responseModel3=response.toString();
			 }catch(Exception ex) { 
				 System.out.println("mmmmmmmmmmmmm"+ex);
				 }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	System.out.println("fees rules update from caller class working..........");
	return responseModel3;
}


/*
 * update Commissiion rules table for selected type and fee amount limit
 */
public  String updateCommissionRules( double rate , int transtypeid , int usertypeid) throws IOException{
	
	String responseModel3 = null;

	String line;

	
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/updateCommission/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(rate);
		str.append("/");
		str.append(transtypeid);
		str.append("/");
		str.append(usertypeid);
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; 
				  while ((responseLine = br.readLine()) != null) {
					  response.append(responseLine.trim());
					  }
				  
			  System.out.println(response.toString()); 
			  responseModel3=response.toString();
			 }catch(Exception ex) { 
				 System.out.println("mmmmmmmmmmmmm"+ex);
				 }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	System.out.println("Commission rules update from caller class working..........");
	return responseModel3;
}
/*
 *  //update Commissiion rules table for selected type and fee amount limit
 */



//get fee or rate for selected type and amount limit
public  FeesRules getFeesRules(int transtype,double amountmin,double amountmax) throws IOException{

	FeesRules responseModel3 = null;
	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/getfeesrules/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(transtype);
		str.append("/");
		str.append(amountmin);
		str.append("/");
		str.append(amountmax);
		String fullurl = str.toString();
		System.out.println(str.toString());
		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
	
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
	
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel3 = mapper.readValue(response, new TypeReference<FeesRules>(){});
		System.out.println("asdas");
		
		conn.disconnect();
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	//System.out.println(responseModel3.size() +"fffffffffffffffffffff");
	return responseModel3;
}

//update fee post request it will update temp table and fee category table
public  String updateCommission(CommissionUpdate commissionUpdate) throws IOException{

	String responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/commissionUpdate";
		
		
		URL url = new URL(api_string);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
	
		JSONObject jsonInput = new JSONObject();
		
		jsonInput.put("transactionTypesId", commissionUpdate.getTransactionTypesId());
		jsonInput.put("userTypeId", commissionUpdate.getUserTypeId());
		jsonInput.put("newRate", commissionUpdate.getNewRate());
		jsonInput.put("updateFromDate", commissionUpdate.getUpdateFromDate());
		jsonInput.put("requestStatus", "pending");
	
		
		try(OutputStream os = conn.getOutputStream()) {
			String jsonInputString= jsonInput.toString();
		    byte[] input = jsonInputString.getBytes("utf-8");
		    os.write(input, 0, input.length);           
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; while ((responseLine =
			  br.readLine()) != null) { response.append(responseLine.trim()); }
			  System.out.println(response.toString()); responseModel3=response.toString();
			 }catch(Exception ex) { System.out.println("mmmmmmmmmmmmm"+ex); }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}


//get Commission by transaction types id for each user type
public  List<CommissionRules> getCommissionDtails(int transactionTypesId) throws IOException{
	
	List<CommissionRules> responseModel = null;
	
	String line;
	
	  try {

		 String api_string = "http://213.136.79.138:8092/api/beet/getCommissionsrules/";
		 StringBuilder str = new StringBuilder();
		 str.append(api_string);
		 str.append(transactionTypesId);
		
		String fullurl = str.toString();
		
		URL url = new URL(fullurl);
		
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel = mapper.readValue(response, new TypeReference<List<CommissionRules>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel);
	  return responseModel;
	}



//update fee post request it will update temp table and fee category table
public  String updateFees(FeesUpdate feesUpdate) throws IOException{

	String responseModel3 = null;

	String line;
	
	try {
		String api_string = "http://213.136.79.138:8092/api/beet/feesupdate";
		
		
		URL url = new URL(api_string);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json; utf-8");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
	
		JSONObject jsonInput = new JSONObject();
		
		jsonInput.put("transactionTypesId", feesUpdate.getTransactionTypesId());
		jsonInput.put("minAmount", feesUpdate.getMinAmount());
		jsonInput.put("maxAmount", feesUpdate.getMaxAmount());
		jsonInput.put("newFee", feesUpdate.getNewFee());
		jsonInput.put("newFeeRate", feesUpdate.getNewFeeRate());
		jsonInput.put("updateFromDate", feesUpdate.getUpdateFromDate());
		jsonInput.put("requestStatus", "pending");
	
		
		try(OutputStream os = conn.getOutputStream()) {
			String jsonInputString= jsonInput.toString();
		    byte[] input = jsonInputString.getBytes("utf-8");
		    os.write(input, 0, input.length);           
		}catch(Exception ex) {
			System.out.println(ex);
		}
		
		
			  try(BufferedReader br = new BufferedReader( new
			  InputStreamReader(conn.getInputStream(), "utf-8"))) { 
				 
				  StringBuilder response = new StringBuilder(); String responseLine = null; while ((responseLine =
			  br.readLine()) != null) { response.append(responseLine.trim()); }
			  System.out.println(response.toString()); responseModel3=response.toString();
			 }catch(Exception ex) { System.out.println("mmmmmmmmmmmmm"+ex); }
			 
	
	
	} catch (MalformedURLException e) {
	
		e.printStackTrace();
	
	} catch (IOException e) {
	  throw new RuntimeException(e);
	}
	System.out.println("dfdsf"+responseModel3);
	return responseModel3;
}

//get merchant types for subscriber
public  List<MerchantTypes> getMerchantTypeByAccount(String accno) throws IOException{
	
	List<MerchantTypes> responseModel2 = null;
	
	String line;
	
	  try {
		String api_string = "http://213.136.79.138:8092/api/beet/merchanttypesexpencescount/";
		StringBuilder str = new StringBuilder();
		str.append(api_string);
		str.append(accno);
		String fullurl = str.toString();

		URL url = new URL(fullurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel2 = mapper.readValue(response, new TypeReference<List<MerchantTypes>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel2);
	  return responseModel2;
	}

public List<ProfileSubscriber> getSuspendedProfiles() throws IOException{
	
	List<ProfileSubscriber> responseModel1 = null;
	
	String line;
	
	  try {

		URL url = new URL("http://213.136.79.138:8092/api/beet/suspendedsub");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel1 = mapper.readValue(response, new TypeReference<List<ProfileSubscriber>>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel1);
	  return responseModel1;
	}


public String updateSuspendedProfiles(String mobileNo) throws IOException{
	
	String responseModel1 = null;
	
	String line;
	
	  try {

			String api_string = "http://213.136.79.138:8092/api/beet/activateacc/";
			StringBuilder str = new StringBuilder();
			str.append(api_string);
			str.append(mobileNo);
			
			String fullurl = str.toString();
			System.out.println(str.toString());
			URL url = new URL(fullurl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");

		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}

		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
		
		StringBuilder content = new StringBuilder();
		
		while ((line = br.readLine()) != null) {
			content.append(line);
			content.append("\n");
		}
		
		String response = "";
		response = content.toString();
		
		String output;
		System.out.println("Output from Server .... \n");
		/*while ((output = br.readLine()) != null) {
			System.out.println(output);
		}*/
		
		ObjectMapper mapper = new ObjectMapper();			
		responseModel1 = mapper.readValue(response, new TypeReference<String>(){});
		System.out.println("asdas");
		
		conn.disconnect();

	  } catch (MalformedURLException e) {

		e.printStackTrace();

	  } catch (IOException e) {
	        throw new RuntimeException(e);
	  }
	  System.out.println("dfdsf"+responseModel1);
	  return responseModel1;
	}
	


}



