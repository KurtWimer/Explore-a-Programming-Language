import core.vararg; //used for functions with unknown number of parameters


class Cubes : RandomAccesInfinite!int{
	private:
		size_t first;

	public:

	this(size_t initial =0){first = initial;} //Constructor

	enum empty = false;   //Infinite range is never empty

	@property int front(){return opIndex(0);}

	void popFront(){++first;}

	/*return the cube at index location*/
	int opIndex(size_t index){
		return (cast(int)index+first)*(cast(int)index+first)*cast(int)index+first);
	}

	int[] opIndex(size_t index,...){
		/*implement*/
	}

	/*Return a copy of the current Cube list*/ 
	@property Cubes save() const{
		return new Cubes(first);};

	int[]  opSlice(size_t i, size_t j){
		/*implement*/
	}
}

void main()
{
	Cubes cubelist = new Cubes();
	if (isRandomAccessRange(Cubes)) writeln("Cubes is a Random Access Range\n");
	writeln("Cubes between 40-50 are:\n");
	foreach(i; cubelist[40..50]){writeln("%d\n" cubelist[i]);}
}

