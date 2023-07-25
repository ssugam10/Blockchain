function check(a,b)
{
    if(a===b)   // using == would've converted it into integer, and returned yes, equal 
    {
        return("Yes, equal");
    }
    return("No, unequal");
}

console.log(check(20,'20'));