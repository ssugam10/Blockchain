const createPerson = (name, age, gender) => {   //returning object using arrow function
    return {
        name : name,
        age : age,
        gender : gender 
    };
};

console.log(createPerson("sugam",18,"male"));

const createHuman = (name, age, gender) => ({name, age , gender});  //simpler way to do it
console.log(createHuman("messi",36,"male"));