import { LightningElement,api } from 'lwc';
import getComRecipe from '@salesforce/apex/ConnectDocumentumExternal.getCompleteRecipe';

export default class SfLwcIntgChild extends LightningElement {

@api recipeId;
@api image;
@api summary;
@api time;
@api price;
@api title;
@api dishTypes;
@api diets;


getRecipe(){

    getComRecipe({recipeId: this.recipeId}).then((data)=>{
        const recipe = JSON.parse(data);
        if(recipe){
            this.image=recipe.image;                
            this.price=recipe.pricePerServing;
            this.time=recipe.readyInMinutes;
            this.summary=recipe.summary;
            this.dishTypes=recipe.dishTypes;
            this.diets=recipe.diets;
        }

    }).catch((error)=>{
        console.error(error);
    })

}



get hasDetails(){

    return this.summary ? true : false; 
}
    
}