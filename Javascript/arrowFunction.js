const realNumberArray = [4,5.6,-9.8,3.14,42,6,8.34,-2];
//Takes only the positive integers and returns an array with their squared values

const squareList = (arr) => {
    const squaredIntegers = arr.filter (num => Number.isInteger(num) && num > 0 ).map( x => x * x);
    return squaredIntegers;
};

const squaredIntegers = squareList(realNumberArray);
console.log(squaredIntegers);