function makeclass(){
    class Vegetable{
        constructor(name){
            this.name=name;
        }
    }
    return Vegetable;
}

const Vegetable = makeclass();
const carrot= new Vegetable('carrot');
console.log(carrot.name);