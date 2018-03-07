import core.vararg; //used for functions with unknown number of parameters
import std.stdio;
import std.range;

//temporary delete or copy : RandomAccesInfinite!int
class Cubes {
	private:
		size_t first;

	public:

	this(size_t initial =0){first = initial;} //Constructor

	enum empty = false;   //Infinite range is never empty

	@property int front(){return opIndex(0);}

	void popFront(){++first;}

	/*return the cube at index location*/
	int opIndex(size_t index){
		int ind = cast(int)index;
		return (ind + first)*(ind + first)*(ind +first);
	}

	/*int[] opIndex(size_t index,...){
		implement
	}*/

	/*Return a copy of the current Cube list*/ 
	@property Cubes save() const{
		return new Cubes(first);};

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
	if (isRandomAccessRange!Cubes) writeln("Cubes has Slicing!\n");
	else writeln("No cake for you.\n");
	writeln("Cubes between 3-10 are:\n");
	foreach(i; cubelist[3..10]){writeln(i);}
}

