var myFootball = 
[
    {
        "name" : "messi",
        "world cup" : 1,
        ballandors : 7
    },

    {
        "name" : "ronaldo",
        "world cup" : 0,
        ballandors : 5
    }
];

var namevalue = myFootball[0].name;
var ballandorvalue = myFootball[0]["ballandors"];

console.log(namevalue + " has " + ballandorvalue + " ballandors");

var myStorage =     //myStorage is a nested object
{
    "car" :
    {
        "inside" : 
        {
            "glove box" : "maps",
            "passenger seat" : "crumbs"
        },
        "outside" : 
        {
            "trunk" : "jack"
        }
    }
};

var gloveBoxContents = myStorage.car.inside["glove box"];
console.log(gloveBoxContents);