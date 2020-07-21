#Sorts the blocks with the lowest value first

println("")
println("                  -----------------------")
println("                  - BLOCK WORLD         -")
println("                  -----------------------")
print("")

function initialState()

    #prompt number of tables
    print("Enter number of tables : ")
    t = chomp(readline())
    global num_tables = parse(Int, t)

    #Collection to store tables in array
    global tableCollection = Array{String}(undef, num_tables)
    for i ∈ 1:num_tables #

        println()
        print("Enter Table $i : ")
        tableCollection[i] = chomp(readline()) #prompt tables 
        println()  
    end
    println("-------------------------------------")
    print("Enter number of Blocks: ")
    blc = chomp(readline())
    global block_no = parse(Int, blc)
    global blockCollection = Array{String}(undef, block_no)
    for i ∈ 1:block_no 
        println()
        print("Enter Block  $i  : ")
        blockCollection[i] = chomp(readline()) #blocks
        
    end

    #
    println("-------------------------------------")
    print("Enter number of Goal State value for blocks: ")
    global gStateValue = Array{String}(undef, block_no)
    for i ∈ 1:block_no
        println()
        print("Enter Block $i value: ")
        gStateValue[i] = chomp(readline())
    end
    
    #return tableCollection,blockCollection
    println("---------------------------------------------")
    println("||  Initial state configuration of blocks  ||")
    println("---------------------------------------------")
    for i ∈ 1:block_no
        println(blockCollection[i])

    end
    println("")

    println("-----------------------")
    println("||  Number of tables ||")
    println("-----------------------")
    for i ∈ 1:num_tables
        println(tableCollection[i])

    end
    println("----------------------")

    println("")
    println("------------------")
    println("||  Goal state  ||")
    println("-------------------")
    goalState = sort!(blockCollection)
    println(goalState)
    println("----------------")
end
initialState()

function breadthFirstSearch(initialState,goalState)
    queue=[]
    noOfExpadedNodes = 0
    push!(initialState,queue)

    while queue
        currentState = queue.pop(0)

        if isGoal(goalState,currentState)
            #print"goal"
            #print str(currentState)
            return noOfExpadedNodes,currentState
        end
        noOfExpadedNodes = noOfExpadedNodes + 1
        newStateList = currentState.getNewState()
        for newSate in newStateList
            queue.append(newSate)
            newSate.prevState = currentState
            newSate.depth = currentState.depth + 1
        end
        return -1,-1

    end

end

