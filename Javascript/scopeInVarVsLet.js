function checkscope()
{
"use strict";
    let i = "function scope";
    if(true)
    {
        let i = "block scope";      //i declared here using let keyword is local to the if block only
        console.log("Block scope i is: ",i);
    }
    console.log("Function scope i is: ",i);
    return i;
}

checkscope();