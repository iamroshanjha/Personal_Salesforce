import { LightningElement,track } from 'lwc';

export default class Test123 extends LightningElement {


connectedCallback(){
        const Nissan = {   
             No_model: 'Sentra',
             company: 'Nissan'
           };
         Nissan.company = 'MT';
         console.log('this data '+JSON.stringify(Nissan));
 
 
 
 
 
         let oldjson;
         const json = {
         cars: {
             Nissan: [
             { model: 'Sentra', doors: 4 },
             { model: 'Maxima', doors: 4 },
             { model: 'Skyline', doors: 2 },
             ],
             Ford: [
             { model: 'Taurus', doors: 4 },
             { model: 'Escort', doors: 4 },
             ],
         },
         };
         //oldjson = {...json}; //copyig object using spread operator
         oldjson = JSON.parse(JSON.stringify(json));
         json.cars['Nissan'][2].doors = 8;
 
         console.log('old json '+JSON.stringify(oldjson));
         console.log('json '+JSON.stringify(json));


         let a ={data:{10:'11'}};
         let b ={data:{11:'12'}};
         a=b;
         b={data:{12:'13'}};
         console.log(JSON.stringify(a) +' - ' +JSON.stringify(b));
    }
    
renderedCallback(){
       /* const Nissan = {   
            'No model': 'Sentra',
            'company': 'Nissan'
          };
        Nissan.company = 'MT';
        //console.log('this data '+JSON.stringify(Nissan));





        let oldjson;
        const json = {
        cars: {
            Nissan: [
            { model: 'Sentra', doors: 4 },
            { model: 'Maxima', doors: 4 },
            { model: 'Skyline', doors: 2 },
            ],
            Ford: [
            { model: 'Taurus', doors: 4 },
            { model: 'Escort', doors: 4 },
            ],
        },
        };
        oldjson = json;
        json.cars['Nissan'][2].doors = 8;

        console.log('old json '+JSON.stringify(oldjson));
        console.log('json '+JSON.stringify(json));

*/

        let cmp = this.template.querySelectorAll("div");
        /* console.log('here '+cmp.length);
        cmp.forEach((cm) => {
            console.log(cm);
            if(cm.classList[0]%2===0)
                cm.classList.add("white");
            else
                cm.classList.add("black");
         });  */

    for(let i=0; i<cmp.length;i++)
    {
            if(i%2===0)
                cmp[i].classList.add("black");
            else
                cmp[i].classList.add("white");
    }

    }

}