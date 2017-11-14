package controller;

import models.PrgState;
import models.statement.Statement;
import repository.IRepository;
import utils.IExeStack;
import exceptions.EmptyStack;

public class Controller {

    private IRepository repo;

    public Controller(IRepository _repo){
        repo = _repo;
    }

    public void executeOneStep(){

        PrgState program = repo.getCurrentProgram();
        IExeStack<Statement> stack = program.getStack();
        if(stack.isEmpty())
            throw new EmptyStack("Stack is Empty\n");


        Statement st = stack.pop();
        st.execute(program);
        repo.logPrgStateExec();

    }

    public void executeAll(){
        PrgState state = repo.getCurrentProgram();
        IExeStack<Statement> stack = state.getStack();

        while(!stack.isEmpty())
            executeOneStep();
    }






}