#include<time.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
unsigned int row[32],column[32],keys[32],h;
int v;

int main()
{
    printf("\t\t\t\t                 *|*\n\t\t\t\t               **/|\\** \n");                                              // ==|
    printf("\t\t\t\t    **     ******/|\\******     **\n\t\t\t\t    *************/|\\************* \n");                     //   |   
    printf("\t\t\t\t    *************/|\\************* \n\t1024-Bit      \t\t    *************/|\\*************\n");         //   |
    printf("\tBIT LEVEL ENCRYPTION\t     ************/|\\************\n\t\t\t1.1\t     <<<<<<<<<<<<|+|>>>>>>>>>>>>\n");      //   |= all this is just ASCII
    printf("\t\t\t \t      ***********\\|/*********** \n\t\t\t\t       **********\\|/********** \n");                        //   |  art stuff so ignore it :)
    printf("\t\t\t\t        *********\\|/********* \n\t\t\t\t         ********\\|/******** \n");                             //   |
    printf("\t\t\t\t           ******\\|/****** \n\t\t\t\t              ***\\|/*** \n\t\t\t\t                 *|* \n\n");    // ==|

    char ch;
    printf("Choose an option:\n1.Encrypt a file\n2.Decrypt a file\n\nEnter your option's number:");
    scanf("%s",&ch);


    unsigned long long int bytes=0,bytecount,rounds,i;
    
    if(ch=='1') //*ENCRYPTION
    {

        char file[100],lockedfile[100],keyfile[100];
        printf("\nEnter the file's name which u wanna encrypt:\n");
        scanf("%s",file);
        printf("\nEnter keyfile's name:\n");
        scanf("%s",keyfile);
        printf("\nwhat do u want to call the encrypted file:\n");
        scanf("%s",lockedfile);

        FILE *reader = fopen(file,"rb");
        FILE *keyreader = fopen(keyfile,"rb");
        if(reader==NULL){
            printf("\nError in opening/finding the file %s\n Make sure you have provided the right name with right extension or right path to file\n",file);
            return 0;
        }
        if(keyreader==NULL){
            printf("\nError in opening/finding the file %s\n Make sure you have provided the right name with right extension or right path to file\n",keyfile);
            return 0;
        }
        fseeko(keyreader,0,SEEK_END);
        bytes=ftello(keyreader);
        fseeko(keyreader,0,SEEK_SET);
        if(bytes<128){
            printf("\n%s is too small.For security reasons keyfile's size should be at least 128 bytes.",keyfile);
            return 0;
        }
        clock_t begin,end;
        begin = clock();
        double time_spent;
        printf("\nENCRYPTING FILE..\n...\n");

        FILE *writer = fopen(lockedfile,"wb");



        fread(keys,128,1,keyreader); 
        fclose(keyreader);

        fseeko(reader,0,SEEK_END);
        bytecount=ftello(reader);
        fseeko(reader,0,SEEK_SET);
        
        h=bytecount%128;
        if(h!=0)
        {
            v=128-h;
            bytecount=bytecount+v;
        }
        rounds = bytecount/128;

        for(i=0;i<rounds;i++)
        {
            /*encryption stuff starts here*/
            fread(row,1,128,reader); 
            //core starts here
            asm(    
                
                "pushfq\n\t"                                // Push EFLAGS register and all register values to stack 
                "pushq %%rax\n\t"                           //so that we can restore them later after our execution is finished
                "pushq %%rbx\n\t"
                "pushq %%rcx\n\t"
                "pushq %%rdx\n\t"
                "pushq %%rsi\n\t"
                "pushq %%rdi\n\t"
                "pushq %%rbp\n\t"
                "pushq %%rsp\n\t"
                "pushq %%r8\n\t"
                "pushq %%r9\n\t"
                "pushq %%r10\n\t"
                "pushq %%r11\n\t"
                "pushq %%r12\n\t"
                "pushq %%r13\n\t"
                "pushq %%r14\n\t"
                "pushq %%r15\n\t"

                "xorq    %%r11,%%r11\n\t"                   
                "leaq    keys(%%rip),%%r13\n\t"             //move key array's starting address into r13
                "leaq    row(%%rip),%%r14\n\t"              //move row array's starting address into r14
                "leaq    column(%%rip),%%r15\n"             //move column array's starting address into r15

                //ROUND STARTS HERE
                ".Round%=:\n\t"
                "movl    (%%r13,%%r11,4),%%ecx\n\t"         //move first key from key array's starting address into ecx

                //rotating Rows of 32x32 matrix
                "xorq    %%r8,%%r8\n"                       //initialize r8 as zero

                ".RowJump%=:\n\t"
                    
                    "movl    (%%r14,%%r8,4),%%eax\n\t"      // move first row into eax
                    "rorl    %%cl,%%eax\n\t"                // rotate row in rax by "cl" bits towards RIGHT
                    "rorq    $7,%%rcx\n\t"                  // update key
                    "movl    %%eax,(%%r14,%%r8,4)\n\t"      // move row back to the address pointed by r14
                    "incl    %%r8d\n\t"                     // increment address to point to next row

                    "movl    (%%r14,%%r8,4),%%eax\n\t"      // move next row into rax
                    "roll    %%cl,%%eax\n\t"                // rotate row in rax by "cl" bits towards LEFT
                    "rorq    $3,%%rcx\n\t"                  // update key
                    "movl    %%eax,(%%r14,%%r8,4)\n\t"      // move row back to the address pointed by r14
                    "incl    %%r8d\n\t"                     // increment address to point to next row

                    "cmp     $32,%%r8\n\t"                  // check if all rows have rotated or not
                    "jne    .RowJump%=\n\t"                 // if not then loop back
                    

                "xorq    %%r9,%%r9\n\t"

                // bitwise operations
                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14)\n\t"                // XOR one row with one key

                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14,%%r11,4)\n\t"        // XOR one row with one key

                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14,%%r11,4)\n\t"        // XOR one row with one key


                // convert rows to columns

                ".RowOuter%=:\n\t"

                    "xorq    %%r8,%%r8\n"
                    ".RowInner%=:\n\t"

                        "bt      %%r9d,(%%r14,%%r8,4)\n\t"
                        "jnc    .RowReset%=\n\t"               
                        "bts     %%r8d,%%r10d\n\t"
                        "jmp    .RowExit%=\n"

                        ".RowReset%=:\n\t"
                        "btr     %%r8d,%%r10d\n"

                    ".RowExit%=:\n\t"
                    "incl    %%r8d\n\t"
                    "cmp     $32,%%r8d\n\t"                 // check condition....
                    "jne    .RowInner%=\n\t"                // if not true loop back to .Inner
                    "movl    %%r10d,(%%r15,%%r9,4)\n\t"
                    "incq    %%r9\n\t"
                    "cmp     $32,%%r9\n\t"                  //check condition....
                    "jne    .RowOuter%=\n\t"                // if not true loop back to .Outer

                // rotating Columns of the 32x32 matrix
                "xorq    %%r8,%%r8\n"                       // Everything from here onwards is same as code above which 
                "incl    %%r11d\n\t"                        // processed rows but here columns are processed
                "movl    (%%r13,%%r11,4),%%ecx\n\t"           
                
                ".ColJump%=:\n\t"

                    "movl    (%%r15,%%r8,4),%%eax\n\t"        
                    "rorl    %%cl,%%eax\n\t"                  
                    "rorq    $9,%%rcx\n\t"                    
                    "movl    %%eax,(%%r15,%%r8,4)\n\t"        
                    "incl    %%r8d\n\t"                        
                    "movl    (%%r15,%%r8,4),%%eax\n\t"        
                    "roll    %%cl,%%eax\n\t"                  
                    "rorq    $11,%%rcx\n\t"
                    "movl    %%eax,(%%r15,%%r8,4)\n\t"
                    "incl    %%r8d\n\t"

                    "cmp     $32,%%r8\n\t"                        
                    "jne    .ColJump%=\n\t"                       

                // bitwise operations
                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15)\n\t"         
                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15,%%r11,4)\n\t"         
                "incl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15,%%r11,4)\n\t"         

                "incl    %%r11d\n\t"                        
                "cmp     $32,%%r11\n\t"                       
                "je     .ExitRound%=\n\t"                        

                // Convert columns to row
                "xorq    %%r9,%%r9\n"
                ".ColOuter%=:\n\t"

                    "xorq    %%r8,%%r8\n"
                    ".ColInner%=:\n\t"

                        "bt      %%r9,(%%r15,%%r8,4)\n\t"
                        "jnc    .ColReset%=\n\t"               
                        "bts     %%r8d,%%r10d\n\t"
                        "jmp    .ColExit%=\n"

                        ".ColReset%=:\n\t"
                        "btr     %%r8d,%%r10d\n"

                    ".ColExit%=:\n\t"
                    "incl    %%r8d\n\t"
                    "cmp     $32,%%r8d\n\t"                 //check condition....
                    "jne    .ColInner%=\n\t"                // if not true loop back to .Inner
                    "movl    %%r10d,(%%r14,%%r9,4)\n\t"
                    "incq    %%r9\n\t"
                    "cmp     $32,%%r9\n\t"                  //check condition....
                    "jne    .ColOuter%=\n\t"                // if not true loop back to .Outer
                    
                "jmp    .Round%=\n"                         // keep looping until all keys in key array are used
                ".ExitRound%=:\n\t"                         // if all keys are used exit from here

                "popq %%r15\n\t"                            // pop out all the values we pushed onto stack to restore states of all registers
                "popq %%r14\n\t"
                "popq %%r13\n\t"
                "popq %%r12\n\t"
                "popq %%r11\n\t"
                "popq %%r10\n\t"
                "popq %%r9\n\t"
                "popq %%r8\n\t"
                "popq %%rsp\n\t"
                "popq %%rbp\n\t"
                "popq %%rdi\n\t"
                "popq %%rsi\n\t"
                "popq %%rdx\n\t"
                "popq %%rcx\n\t"
                "popq %%rbx\n\t"
                "popq %%rax\n\t"
                "popfq\n\t"   // Pop EFLAGS register

                :
                :  
                : "cc"
            );
            //core ends here
            fwrite(column,128,1,writer);
            /*encryption stuff ends here*/
        }
        
        fclose(reader);
        fclose(writer);
        end = clock();
        time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
        printf("\n\nEncryption of %llu bytes completed in %f seconds ",bytecount,time_spent);
        printf("\n\nPress any key to exit\n");
        return 0;

    }

    else if (ch=='2') //DECRYPTION                             Entire decryption process is same as encryption but is exactly reverse order
    {                                                       // therefore entire decryption code below exactly like enryption but logically 
                                                            // written in reverse

        char lockedfile[100],unlockedfile[100],keyfile[100];
        printf("\nEnter the file's name which u wanna decrypt:\n");
        scanf("%s",lockedfile);
        printf("\nEnter keyfile's name:\n");
        scanf("%s",keyfile);
        printf("\nwhat do u wanna name the decrypted file:\n");
        scanf("%s",unlockedfile);

        FILE *reader = fopen(lockedfile,"rb");
        FILE *keyreader = fopen(keyfile,"rb");

        if(reader==NULL){
            printf("\nError in opening/finding the file %s\n Make sure you have provided the right name with right extension or right path to file\n",lockedfile);
            return 0;
        }
        if(keyreader==NULL){
            printf("\nError in opening/finding the file %s\n Make sure you have provided the right name with right extension or right path to file\n",keyfile);
            return 0;
        }

        fseeko(keyreader,0,SEEK_END);
        bytes=ftello(keyreader);
        fseeko(keyreader,0,SEEK_SET);

        if(bytes<128){
            printf("\n%s is too small.For security reasons keyfile's should be at least 128 bytes.",keyfile);
            return 0;
        }

        clock_t begin,end;
        begin = clock();
        double time_spent;
        printf("\nDECRYPTING FILE..\n...");

        FILE *writer = fopen(unlockedfile,"wb");

        fread(keys,128,1,keyreader); 
        
        fclose(keyreader);

        fseeko(reader,0,SEEK_END);
        bytecount=ftello(reader);
        fseeko(reader,0,SEEK_SET);


        h=bytecount%128;
        if(h!=0)
        {
            v=128-h;
            bytecount=bytecount+v;
        }
        rounds = bytecount/128;

        for(i=0;i<rounds;i++)
        {
            // decryption stuff starts here
            fread(column,128,1,reader);
            // core starts here
            asm(   
                
                "pushfq\n\t"   
                "pushq %%rax\n\t"
                "pushq %%rbx\n\t"
                "pushq %%rcx\n\t"
                "pushq %%rdx\n\t"
                "pushq %%rsi\n\t"
                "pushq %%rdi\n\t"
                "pushq %%rbp\n\t"
                "pushq %%rsp\n\t"
                "pushq %%r8\n\t"
                "pushq %%r9\n\t"
                "pushq %%r10\n\t"
                "pushq %%r11\n\t"
                "pushq %%r12\n\t"
                "pushq %%r13\n\t"
                "pushq %%r14\n\t"
                "pushq %%r15\n\t"

                "movq    $32,%%r11\n\t"                     
                "leaq    keys(%%rip),%%r13\n\t"               
                "leaq    row(%%rip),%%r14\n\t"                
                "leaq    column(%%rip),%%r15\n"               

                //ROUND STARTS HERE

                ".Round%=:\n\t"
                // bitwise operations

                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15,%%r11,4)\n\t"
            
                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15,%%r11,4)\n\t"
                
                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r15)\n\t"
                
                //shifitng in columns
                
                "xorq    %%r8,%%r8\n"                       
                "decl    %%r11d\n\t"
                    
                "movl    (%%r13,%%r11,4),%%ecx\n\t"             
                
                ".ColJump%=:\n\t"

                    "movl    (%%r15,%%r8,4),%%eax\n\t"        
                    "roll    %%cl,%%eax\n\t"                  
                    "rorq    $9,%%rcx\n\t"                    
                    "movl    %%eax,(%%r15,%%r8,4)\n\t"        
                    "incl    %%r8d\n\t"                        
                    "movl    (%%r15,%%r8,4),%%eax\n\t"        
                    "rorl    %%cl,%%eax\n\t"                  
                    "rorq    $11,%%rcx\n\t"
                    "movl    %%eax,(%%r15,%%r8,4)\n\t"
                    "incl    %%r8d\n\t"
                    
                "cmp     $32,%%r8\n\t"   
                "jne    .ColJump%=\n\t"



                //columns to rows
                "xorq    %%r9,%%r9\n"
                ".ColOuter%=:\n\t"

                    "xorq    %%r8,%%r8\n"
                    ".ColInner%=:\n\t"

                        "bt      %%r9,(%%r15,%%r8,4)\n\t"
                        "jnc    .ColReset%=\n\t"               
                        "bts     %%r8d,%%r10d\n\t"
                        "jmp    .ColExit%=\n"

                        ".ColReset%=:\n\t"
                        "btr     %%r8d,%%r10d\n"

                    ".ColExit%=:\n\t"
                    "incl    %%r8d\n\t"
                    "cmp     $32,%%r8\n\t"
                    "jne    .ColInner%=\n\t"
                    "movl    %%r10d,(%%r14,%%r9,4)\n\t"
                    "incq    %%r9\n\t"
                    "cmp     $32,%%r9\n\t"
                    "jne    .ColOuter%=\n\t"                  // if not true loop back to .Outer


                //// bitwise operations

                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14,%%r11,4)\n\t"
            
                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14,%%r11,4)\n\t"
                
                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%r12d\n\t"
                "xorl    %%r12d,(%%r14)\n\t"


                ////shifting in rows
                "xorq    %%r8,%%r8\n"                       
                "decl    %%r11d\n\t"
                "movl    (%%r13,%%r11,4),%%ecx\n\t"             

                ".RowJump%=:\n\t"

                    "movl    (%%r14,%%r8,4),%%eax\n\t"        
                    "roll    %%cl,%%eax\n\t"                  
                    "rorq    $7,%%rcx\n\t"                    
                    "movl    %%eax,(%%r14,%%r8,4)\n\t"        
                    "incl    %%r8d\n\t"                        

                    "movl    (%%r14,%%r8,4),%%eax\n\t"        
                    "rorl    %%cl,%%eax\n\t"                  
                    "rorq    $3,%%rcx\n\t"
                    "movl    %%eax,(%%r14,%%r8,4)\n\t"
                    "incl    %%r8d\n\t"


                "cmp     $32,%%r8\n\t"    
                "jne    .RowJump%=\n\t"

                "xorq    %%r9,%%r9\n\t"

                "cmp     $0,%%r11\n\t"   
                "jle     .ExitRound%=\n\t"
                // rows to columns

                ".RowOuter%=:\n\t"

                    "xorq    %%r8,%%r8\n"
                    ".RowInner%=:\n\t"

                        "bt      %%r9d,(%%r14,%%r8,4)\n\t"
                        "jnc    .RowReset%=\n\t"               
                        "bts     %%r8d,%%r10d\n\t"
                        "jmp    .RowExit%=\n"

                        ".RowReset%=:\n\t"
                        "btr     %%r8d,%%r10d\n"

                    ".RowExit%=:\n\t"
                    "incl    %%r8d\n\t"
                    "cmp     $32,%%r8\n\t"
                    "jne    .RowInner%=\n\t"
                    "movl    %%r10d,(%%r15,%%r9,4)\n\t"
                    "incq    %%r9\n\t"
                    "cmp     $32,%%r9\n\t"
                    "jne    .RowOuter%=\n\t"

                "jmp    .Round%=\n"
                ".ExitRound%=:\n\t"

                "popq %%r15\n\t"
                "popq %%r14\n\t"
                "popq %%r13\n\t"
                "popq %%r12\n\t"
                "popq %%r11\n\t"
                "popq %%r10\n\t"
                "popq %%r9\n\t"
                "popq %%r8\n\t"
                "popq %%rsp\n\t"
                "popq %%rbp\n\t"
                "popq %%rdi\n\t"
                "popq %%rsi\n\t"
                "popq %%rdx\n\t"
                "popq %%rcx\n\t"
                "popq %%rbx\n\t"
                "popq %%rax\n\t"
                "popfq\n\t"

                :
                :  
                : "cc"
            );
            //core ends here
            fwrite(row,128,1,writer);
            /*encryption stuff ends here*/
        }
        fclose(reader);
        fclose(writer);
        end = clock();
        time_spent = (double)(end - begin) / CLOCKS_PER_SEC;    
        printf("\n\nDecryption of %llu bytes completed in %f seconds ",bytecount,time_spent);
        return 0;
        
    }
    else
    {
        printf("invalid input");
        return 0;
    }
    
}