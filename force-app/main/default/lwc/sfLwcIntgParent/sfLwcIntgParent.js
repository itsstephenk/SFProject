import { LightningElement } from 'lwc';
import getRecipe from '@salesforce/apex/ConnectDocumentumExternal.getRecipeByIngred';

export default class SfLwcIntgParent extends LightningElement {
    recipes = [];
    
getRecipeById(){
    const ingred = this.template.querySelector(".ingredient-search").value;
getRecipe({ingred}).then((data)=>{
this.recipes = JSON.parse(data) ;
console.log(JSON.parse(data));
}).catch((error)=>{
    console.error(error);
});
    }
    
}