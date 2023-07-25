const bicycle = {
    gear : 2,
    setGear(newgear)    //This is a fucntion inside an object
    {
        "use strict";
        this.gear=newgear;
    }
};

bicycle.setGear(3);
console.log(bicycle.gear);