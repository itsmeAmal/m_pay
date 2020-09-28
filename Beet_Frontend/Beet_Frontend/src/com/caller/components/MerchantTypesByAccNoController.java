package com.caller.components;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import com.caller.Callers;
import com.caller.MerchantTypes;
import com.caller.ProfileDistributionN;
import java.text.DecimalFormat;

public class MerchantTypesByAccNoController {
	
	public MerchantTypesByAccNo merchantTypeByAccNo(String accno) throws IOException {

	Callers callObj = new Callers();
	MerchantTypesByAccNo merchantTypesByAccNo =new MerchantTypesByAccNo();
	List<MerchantTypes> allMTypes = callObj.getMerchantTypeByAccount(accno);
		  DecimalFormat df = new DecimalFormat("0.00");
	
	
		
		if(allMTypes.size()==4) {
			merchantTypesByAccNo.setTop1Name(allMTypes.get(0).getMerchant_category());
			merchantTypesByAccNo.setTop1Count(allMTypes.get(0).getCount());
			merchantTypesByAccNo.setTop2Name(allMTypes.get(1).getMerchant_category());
			merchantTypesByAccNo.setTop2Count(allMTypes.get(1).getCount());
			merchantTypesByAccNo.setTop3Name(allMTypes.get(2).getMerchant_category());
			merchantTypesByAccNo.setTop3Count(allMTypes.get(2).getCount());
			merchantTypesByAccNo.setTop4Name(allMTypes.get(3).getMerchant_category());
			merchantTypesByAccNo.setTop4Count(allMTypes.get(3).getCount());
		}else if(allMTypes.size()==3) {
			merchantTypesByAccNo.setTop1Name(allMTypes.get(0).getMerchant_category());
			merchantTypesByAccNo.setTop1Count(allMTypes.get(0).getCount());
			merchantTypesByAccNo.setTop2Name(allMTypes.get(1).getMerchant_category());
			merchantTypesByAccNo.setTop2Count(allMTypes.get(1).getCount());
			merchantTypesByAccNo.setTop3Name(allMTypes.get(2).getMerchant_category());
			merchantTypesByAccNo.setTop3Count(allMTypes.get(2).getCount());
			merchantTypesByAccNo.setTop4Name("");
			merchantTypesByAccNo.setTop4Count(0);
			
		}else if(allMTypes.size()==2) {
			merchantTypesByAccNo.setTop1Name(allMTypes.get(0).getMerchant_category());
			merchantTypesByAccNo.setTop1Count(allMTypes.get(0).getCount());
			merchantTypesByAccNo.setTop2Name(allMTypes.get(1).getMerchant_category());
			merchantTypesByAccNo.setTop2Count(allMTypes.get(1).getCount());
			merchantTypesByAccNo.setTop3Name("");
			merchantTypesByAccNo.setTop3Count(0);
			merchantTypesByAccNo.setTop4Name("");
			merchantTypesByAccNo.setTop4Count(0);
			
		}else if(allMTypes.size()==1) {
			merchantTypesByAccNo.setTop1Name(allMTypes.get(0).getMerchant_category());
			merchantTypesByAccNo.setTop1Count(allMTypes.get(0).getCount());
			merchantTypesByAccNo.setTop2Name("");
			merchantTypesByAccNo.setTop2Count(0);
			merchantTypesByAccNo.setTop3Name("");
			merchantTypesByAccNo.setTop3Count(0);
			merchantTypesByAccNo.setTop4Name("");
			merchantTypesByAccNo.setTop4Count(0);
			
		}else {
			System.out.println("nooooooooooooooooooooooooooo");
		}
		
		
		
	System.out.println(allMTypes.size()+"111111111111");
	return merchantTypesByAccNo;
	
	
}

}