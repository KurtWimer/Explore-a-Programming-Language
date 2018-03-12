import std.stdio;
import std.range;
/**
*Purpose: Infinite Random Access Rank that returns index values^3
*/
class Cubes {
	private:
		size_t first; ///Maintains the starting element. Change to this using popfront() should be avoided

	public:
	/**Purpose: Creates a new cubelist 
	*Params: initial = offset from which values will be calculated
	*/
	this(size_t initial =0){first = initial;} 

	enum empty = false;   //Infinite range is never empty

	@property int front(){return opIndex(0);}

	///Included as a Range requirement, avoid using to eliminate potential confusion
	void popFront(){++first;}

	/**
	*Purpose: Overrides syntax of "cubelist[x]" to return the value of x^3
	*Return: the cube at parameter 'index' location
	*/
	int opIndex(size_t index){
		int ind = cast(int)index;
		return (ind + first)*(ind + first)*(ind +first);
	}


	/*Return a copy of the current Cube list*/ 
	@property Cubes save() const{
		return new Cubes(first);};

	/**
	*Purpose: Overrides syntax of "cubelist[min..max]" to return the value of x^3
	*Return: An array of elements greater than or equal to 'min' and less than 'max', cubed
	*/	
	@property int[] opSlice(size_t min, size_t max){
		int[] a;
		a.length = max - min; 
		for(size_t i = min; i<max; ++i){
			a[i - min] = opIndex(i); 
		}
	return a; 
	}
}

void main()
{
	Cubes cubelist = new Cubes();
	if (isRandomAccessRange!Cubes) writeln("Cubes is a Random Access Range!\n");
	else writeln("Housten we have an issue\n");
	if (hasSlicing!Cubes) writeln("Cubes has Slicing!\n");
	else writeln("No cake for you.\n");
	writeln("Cubes between 3-10 are:\n");
	foreach(i; cubelist[3..10]){writeln(i);}
}

