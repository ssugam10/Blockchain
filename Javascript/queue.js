function nextInLine(arr,item)
{
    arr.push(item);
    return(arr.shift());
}

var myArray = [1,2,3,4,5];
console.log("Before: " + JSON.stringify(myArray));      
console.log(nextInLine(myArray,6));
console.log("After: " + JSON.stringify(myArray));
