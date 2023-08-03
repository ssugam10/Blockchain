// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    //This gets initialized to zero!
    uint256 Number;  //creating a getter function for Number(fn that says to return the value of Number)
                            //default visibility is internal
                            //as long as public keyword is present, Number is considered as a view fucntion with return of uint256

    //Creating a function
    function store(uint256 _Number) public virtual      //virtual keyword allows fn to be overriden
    {
        Number = _Number;
    }

    //returns means what the funtion gives us after we call it.
    
    //view, pure dont cost gas untill called inside a fn that consumes gas
    function retrieve() public view returns(uint256)
    {
        return Number;
    }

    // function add() public pure returns(uint256)
    // {
    //     return(1+1);
    // }


    struct people   //people now becomes a new data type like uint etc.
    {
        uint256 favNum;
        string name;
    }

    //people public human=people({favNum : 2 , name : "sugam"});  //human here is a variable

    //uint256[] public numbers;
    people[] public homosapiens;    //homosapiens is an array of data type people

    //creating a mapping
    mapping(string => uint256) public nameToFavNum;


    //calldata, memory, storage
    function addperson(string memory _name,uint256 _favnumber) public
    {
        homosapiens.push(people(_favnumber,_name)); //pushing in the array
        nameToFavNum[_name]=_favnumber; //creating maps
    }

}