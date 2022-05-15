public with sharing class ConnectDocumentumExternal {
    
    Private static Final String END_POINT_URL = 'https://api.spoonacular.com'; 
    Private static Final String API_KEY = '500cba24c482408b907c1bedc4e385dd'; 

    @AuraEnabled
 public static String getRecipeByIngred(String ingred){
try{
    Http ht = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(END_POINT_URL+'/recipes/findByIngredients?ingredients='+ingred+'&number=10&apiKey='+API_KEY);
   //req.setHeader('apiKey', API_KEY);
   // req.setHeader('Authorization', 'Bearer '+'access_token');
   // req.setHeader('content-type', 'application/json');
    req.setMethod('GET');
    HttpResponse res =  ht.send(req);

    if(res.getStatusCode()==200){
        System.debug(res.getBody());
        return res.getBody();
    }
    return '';
 } 
 catch(Exception e){
     throw new AuraHandledException(e.getMessage());
 }  

}

@AuraEnabled
public static string getCompleteRecipe(String recipeId){
    try {

        Http ht1 = new Http();
        HttpRequest req1 = new HttpRequest();
        req1.setEndpoint(END_POINT_URL+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        //req1.setHeader('apiKey', API_KEY);
        // req.setHeader('Authorization', 'Bearer '+'access_token');
        // req.setHeader('content-type', 'application/json');
        req1.setMethod('GET');
         HttpResponse res1 =  ht1.send(req1);

         if(res1.getStatusCode()==200){
         return res1.getBody();
         }

           return '';

         
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

}
