<h1>
	Lucee 5
</h1>
<cfscript>
	echo( '<h1>1</h1>' )
	// Correctly returns 1
	func = function(x) { return x+1; }
	writeDump( func(0) )
	
	echo( '<h1>2</h1>' )
	// Correctly returns 2
	func = (x) => x+1
	writeDump( func(1) )
	
	echo( '<h1>null</h1>' )
	// Correctly returns undefined as no return statement is used in combination with curlies
	func = (x) => { x+1; }
	writeDump( func(5) )
	
	echo( '<h1>3</h1>' )
	// Correctly returns 3
	func = () => 3
	writeDump( func() )
	
	// Syntax Error, Invalid Construct
	// https://luceeserver.atlassian.net/browse/LDEV-2417
	// func = x => x+1
	//writeDump( func(3) )
	
	// Syntax Error, Invalid Construct
	// https://luceeserver.atlassian.net/browse/LDEV-2417
	// func = x =>  { x+1 }
	//writeDump( func(3) )
	
	// Syntax Error, Invalid Construct
	// https://luceeserver.atlassian.net/browse/LDEV-2417
	//func = x => { return x+1 }
	//writeDump( func(4) )
	
	echo( '<h1>null</h1>' )
	// Correctly returns undefined as no return statement is used in combination with curlies
	func = (x) => { y=x+1; }
	writeDump( func(5) )
	
	// Syntax Error, Invalid Construct
	// https://luceeserver.atlassian.net/browse/LDEV-2417
	// func = x => { x=x+1; }
	// writeDump( func(5) )
	
	echo( '<h1>6</h1>' )
	// Correctly returns 6
	func = (x,y,z) => x+y+z
	writeDump( func(1,2,3) )
	
	// Syntax Error, Invalid Construct
	// https://luceeserver.atlassian.net/browse/LDEV-2417
	// myArr = [1,2,3]
	//myArr.each( x => writeOutput( x ) )
	
	echo( '<h1>7</h1>' )
	// Correctly returns 7
	myArr = [1,3,3]
	writeDump( myArr.reduce( function(acc,x) { return acc+x }, 0 ) )
	
	echo( '<h1>8</h1>' )
	// Correctly returns 8
	myArr = [2,3,3]
	writeDump( myArr.reduce( (acc,x) => { return acc+x }, 0 ) )
	
	echo( '<h1>9</h1>' )
	myArr = [3,3,3]
	writeDump( myArr.reduce( (acc,x) => acc+x, 0 ) )
	
	echo( '<h1>10</h1>' )
	myArr = [3,3,4]
	writeDump( myArr.reduce( (acc=0,x) => acc+x ) )
	
	echo( '<h1>11</h1>' )
	myArr = [3,4,4]
	writeDump( myArr.reduce( (acc=0,x) => {return acc+x} ) )
	
	echo( '<h1>12</h1>' )
    myarray = [ ()=>12 ]
    // The function [1] does not exist in the Object, only the following functions are available: [append,avg,clear,contains,containsNoCase,delete...
    // https://luceeserver.atlassian.net/browse/LDEV-2489?
    // writeOutput( myarray[ 1 ]() )
</cfscript>