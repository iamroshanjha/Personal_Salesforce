public class DSATest {
    
    public static void checkNinKsegmentofArray(List<Integer> input, Integer k, Integer n)
    {
        Boolean flag = false;
        //Integer k=3;
        //Integer n=3;
        //Integer[] input = new List<Integer>{3, 5, 2, 4, 9, 3, 1, 7, 3, 11, 12, 3};
        //List<Integer> input = new List<Integer>{3, 5, 2, 4,  9,  3,1, 7, 3, 11, 12, 3};
        Integer length = input.size();
        for(Integer i=0;i<length;i=i+k) 
        {
            List<Integer> tempdata = new List<Integer>();
            for(Integer j=0;j<k;j++)
            {
                if(i+j<length)
                	tempdata.add(input[j+i]);
                else
                    break;
            }
            system.debug(tempdata);
            if(tempdata.contains(n))
                flag = true;
            else
                flag=false;
            
            
        }
        system.debug(flag);
    }
    
    public static void maxormin(List<Integer> input)
    {
        //{3, 2, 1, 56, 10000, 167}
        Integer min;
        Integer max;
        for(Integer i=0;i<input.size();i++)
        {
            for(Integer j=0;j<input.size();j++)
            {
                if(input[j]>input[i])
                {
                    Integer temp = input[i];
                    input[i]=input[j];
                    input[j]=temp;
                }
                
            }
        }
        max=input[input.size()-1];
        min=input[0];
        System.debug(input +' '+max+' '+min);
    }
	
    public static void negposaside(List<Integer> arr)
    {
        Integer n = arr.Size();
        List<Integer> arrn = new List<Integer>();
        List<Integer> arrp = new List<Integer>();
        for(Integer i : arr)
        {
            if(i<0)
            {
                arrn.add(i);
            }
            else
            {
                arrp.add(i);
            }
        }
        arrp.addAll(arrn);
        system.debug(arrp);
    }
    
    public static void rotateclock(List<Integer> arr)
    {
        Integer n= arr.Size();
        Integer last = arr[n-1];
        for(Integer i=n-1;i>0;i--)
        {
            
            arr[i]=arr[i-1];
            
        }
        arr[0]=last;
        System.debug(arr);
    }
    
    public static void bubblesort(List<Integer> arr)
    {
        //3, 2, 1, 56, 10000, 167
        Integer n = arr.size();
        for(Integer i=0;i<n-1;i++)
        {
            for(Integer j=0;j<n-i;j++)
            {
                if(arr[j]>arr[j+1])
                {
                    Integer temp = arr[j];
                    arr[j]=arr[j+1];
                    arr[j+1]=temp;
                }
            }
        }
        system.debug(arr);
    }
    
    public static void selectionsort(List<Integer> arr)
    {
        system.debug(arr);
        Integer n=arr.size();
        for(Integer i=0;i<n-1;i++)
        {
            Integer min=i;
            for(Integer j=i+1;j<n;j++)
            {
                if(arr[j]<arr[min])
                {
                   min=j;
                }
            }
            Integer temp = arr[i];
            arr[i]=arr[min];
            arr[min]=temp; 
        }
        system.debug(arr);
    }
    
    public static List<Integer> mergesort(List<Integer> arr, Integer low, Integer high)
    {
        //system.debug('i '+arr);
        if(low==high)
        {
            return new List<Integer>{arr[low]};
        }
        system.debug('low '+low);
        system.debug('high '+high);
        Integer mid = (low+high)/2;
        system.debug('mid '+mid);
        List<Integer> fsa = mergesort(arr,low,mid);
        system.debug('a '+fsa);
        List<Integer> ssa = mergesort(arr,mid+1,high);
        system.debug('b '+ssa);
        List<Integer> mergearray= mergesortedarray(fsa,ssa);
        system.debug('mergearray '+mergearray);
        return mergearray;
        
    }
    
    private static List<Integer> mergesortedarray(List<Integer> a, List<Integer> b)
    {
        List<Integer> result = new List<Integer>();
        try{
        system.debug('mergesortedarray '+a +' ' +b);
        
        Integer i=0;
        Integer j=0;
        
        while(i<a.size() && j<b.size())
        {
            if(a[i]>b[j])
            {
                result.add(b[j]);
                j++;
            }
            else if(a[i]<b[j])
            {
                result.add(a[i]);
                i++;
            }
        }
        
        while(i<a.size())
        {
            result.add(a[i]);
            i++;
        }
        while(j<b.size())
        {
            result.add(b[j]);
            j++;
        }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber());
        }
        return result;
    }
    
    public static void part01(List<Integer> arr)
    {
        system.debug(arr);
        Integer i=0;
        Integer j=0;
        
        while(i<arr.Size())
        {
            if(arr[i]==1)
            	i++;
            else
            {
               Integer temp = arr[i];
               arr[i]=arr[j];
               arr[j]=temp;
               i++;
               j++;
            }
            
        }
        system.debug(arr);
    }
    
    public static void part012(List<Integer> arr)
    {
        System.debug(arr);
        Integer i=0;
        Integer j=0;
        Integer k=arr.Size()-1;
        
        while(i<=k)
        {
            if(arr[i]==0)
            {
                Integer temp = arr[i];
                arr[i]=arr[j];
                arr[j]=temp; 
                i++;
                j++;
            }
            else if(arr[i]==1)
            {
                i++;
            }
            else if(arr[i]==2)
            {
                Integer temp = arr[k];
                arr[k]=arr[i];
                arr[i]=temp; 
                k--;
            }
        }
        System.debug(arr);
    }
}