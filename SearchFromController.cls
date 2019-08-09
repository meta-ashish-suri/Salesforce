public with sharing class SearchFromController {
   
     public String name{get; set;}
    public List<Account> accounts{get; set;}
    public Boolean searched{get; set;}
    public SearchFromController(){
        searched=false;
        String nameStr=ApexPages.currentPage().getParameters().get('name');
        if(null!=nameStr){
            name = nameStr;
            executeSearch();
        }
    } 
    
        public pageReference executeSearch(){
            searched = true;
            String search = '%'+name+'%';
            accounts = [select id, Name, Industry, Type from Account where name LIKE :search];
            return null;
        }

}