Import std.datetime.systime.clock;//Timing element
Import std.array;
Import std.algorithm.mutation;	//Swap Function

/*
*Function: selectionsort
*Purpose: Sorts a given array of any length using the selection sort algorithm
*Effeciency: O(n^2)
*Paramaters: int array to be sorted
*Return: Void
*/
void selectionsort(int [] array){
	for (size_t i = 0; i<array.length; ++i){
		int min = array[i];
		size_t min_loc = i;
		//Finds smallest value remaining
		for(size_t j = i; j<array.length; ++j;){
			if (array[i] > min) min_loc = i;
		}
		//Checks if a smaller value has been found and swaps
		if(min_loc != i) swap(aarray[i],array[min_loc])
	}
}

void void main(string[] args)
{
	//Import and read file into an array
	auto file = File(unsorted.txt,"r")
	int array[];
	//Sets default arraysize change based upon application
	array.length = 100;
	auto filled = 0;
	while(file.freadf("%d\n",array[filled++])) if(filled = array.length - 1) array.length *=2;
	
	//Trims array length so defuat entries do not interfere with the sort
	array.length = array.filled;

	//Time and perform selectionsort
	auto sw = StopWatch(AutoStart.yes);
	selectionsort(array);
	sw.stop();
	writeln("Time elapsed: %f",sw.peek());
	Return;
}
