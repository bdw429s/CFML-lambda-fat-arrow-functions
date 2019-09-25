<h1>
	2018
</h1>
<cfscript>	
	
	writeOutput( '<h1>1</h1>' )
	// Correctly returns 1
	func = function(x) { return x+1; }
	writeDump( func(0) )
	
	writeOutput( '<h1>2</h1>' )
	// Correctly returns 2
	func = (x) => x+1
	writeDump( func(1) )
	
	writeOutput( '<h1>undefined</h1>' )
	// Correctly returns undefined as no return statement is used in combination with curlies
	func = (x) => { x+1; }
	writeDump( func(5) )
	
	writeOutput( '<h1>3</h1>' )
	// Correctly returns 3
	func = () => 3
	writeDump( func() )
	
	writeOutput( '<h1>4</h1>' )
	// Correctly returns 4
	func = x => x+1
	writeDump( func(3) )
	
	writeOutput( '<h1>undefined</h1>' )
	// Incorrectly returns 4.  Should be undefined since no explicit return statement is used inside of curlies
	// https://tracker.adobe.com/#/view/CF-4205245
	func = x =>  { x+1 }
	writeDump( func(3) )
	
	writeOutput( '<h1>5</h1>' )
	// Correctly returns 5
	func = x => { return x+1 }
	writeDump( func(4) )
	
	writeOutput( '<h1>undefined</h1>' )
	// Correctly returns undefined as no return statement is used in combination with curlies
	func = (x) => { y=x+1; }
	writeDump( func(5) )
	
	// Invalid CFML construct found on line x at column y. ColdFusion was looking at the following text: =
	// https://tracker.adobe.com/#/view/CF-4205246
	// func = x => { x=x+1; }
	// writeDump( func(5) )
	
	writeOutput( '<h1>6</h1>' )
	// Correctly returns 6
	func = (x,y,z) => x+y+z
	writeDump( func(1,2,3) )
	
	writeOutput( '<h1>123</h1>' )
	// Correctly outputs 123
	myArr = [1,2,3]
	myArr.each( x => writeOutput( x ) )
	
	writeOutput( '<h1>7</h1>' )
	// Correctly returns 7
	myArr = [1,3,3]
	writeDump( myArr.reduce( function(acc,x) { return acc+x }, 0 ) )
	
	writeOutput( '<h1>8</h1>' )
	// Correctly returns 8
	myArr = [2,3,3]
	writeDump( myArr.reduce( (acc,x) => { return acc+x }, 0 ) )
	
	myArr = [3,3,3]
	// Parameter validation error for the reduce function.  The function accepts 1 to 2 parameter(s).
	// Improper parsing of closure
	// https://tracker.adobe.com/#/view/CF-4205247
	// writeDump( myArr.reduce( (acc,x) => acc+x, 0 ) )
	
	myArr = [3,3,3]
	// The value cfindex2ecfm554899937$func_CF_ANONYMOUSCLOSURE_444 cannot be converted to a number.
	// https://tracker.adobe.com/#/view/CF-4205248
	// writeDump( myArr.reduce( (acc=0,x) => acc+x ) )
	
	writeOutput( '<h1>9</h1>' )
	myArr = [3,3,3]
	// Correctly returns 9
	writeDump( myArr.reduce( (acc=0,x) => {return acc+x} ) )
	
	writeOutput( '<h1>12</h1>' )
    myarray = [ ()=>12 ]
    writeOutput( myarray[ 1 ]() )
	
</cfscript>