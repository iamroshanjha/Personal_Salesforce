public class ApexClassLWCSupport {
    @AuraEnabled(cacheable=true)
    public static ApexClassLWCSupport.ApexUserWrapper getUserDetails(Id userId)
    {
        List<User> lstUser = [SELECT Id, Username, Name, Title, City, State, Country, PostalCode, Email, Street,
                              CreatedDate, Profile.Name, CompanyName, MobilePhone,BannerPhotoUrl,FullPhotoUrl,MediumPhotoUrl 
                              FROM User WHERE ID=:userId];
        if(!lstUser.isEmpty())
        {
            System.debug(new ApexClassLWCSupport.ApexUserWrapper(lstUser[0]));
            return new ApexClassLWCSupport.ApexUserWrapper(lstUser[0]);
        }
        else
            return null;
    }
    
    public class ApexUserWrapper {
        @AuraEnabled public Object Username;
        @AuraEnabled public Object FullPhotoUrl;
        @AuraEnabled public Object MediumPhotoUrl;
        @AuraEnabled public Object BannerPhotoUrl;
        @AuraEnabled public Object Name;
        @AuraEnabled public Object Title;
        @AuraEnabled public Object City;
        @AuraEnabled public Object State;
        @AuraEnabled public Object Country;
        @AuraEnabled public Object PostalCode;
        @AuraEnabled public Object Email;
        @AuraEnabled public Object CreatedDate;
        @AuraEnabled public Object ProfileName;
        @AuraEnabled public Object CompanyName;
        @AuraEnabled public Object MobilePhone;
        @AuraEnabled public Object Address;
        
        public ApexUserWrapper(User users)
        {
            this.Username = users.Username;
            this.FullPhotoUrl = users.FullPhotoUrl;
            this.MediumPhotoUrl = users.MediumPhotoUrl;
            this.BannerPhotoUrl = users.BannerPhotoUrl;
            this.Name = users.Name;
            this.Title = users.Title;
            this.City = users.City;
            this.State = users.State;
            this.Country = users.Country;
            this.PostalCode = users.PostalCode;
            this.Email = users.Email;
            this.CreatedDate = users.CreatedDate;
            this.ProfileName = users.Profile.Name;
            this.CompanyName = users.CompanyName;
            this.MobilePhone = users.MobilePhone;
            this.Address = users.Street;
        }
        
    }
}