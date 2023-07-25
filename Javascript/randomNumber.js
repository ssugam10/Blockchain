function randomRange(min,max)   //Takes a range to print random whole numbers in the given range
{
    var number = Math.floor(Math.random() * (max-min+1) + min);
    return number;
}

console.log(randomRange(5,10));