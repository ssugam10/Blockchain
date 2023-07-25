const arr1 = ['Jan','Feb','Mar','Apr','May'];
let arr2;
arr2=[...arr1]; //if it was arr2=arr1, then they would be the same array with two diff names and arr2[0] would be potato after next line
arr1[0]='Potato';
console.log(arr2);
//The spread operator spreads the contents of arr1 in the empty array in which the operator is used