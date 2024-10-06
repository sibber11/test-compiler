#include <iostream>
#include <map>
#include <vector>

#ifndef AST_H
#define AST_H



class Expression
{
private:
    /* data */
public:
    virtual ~Expression() = default;
    virtual void codegen(){
        printf("imepelement codegen");
    };
};

class ConstExpression : public Expression
{
private:
    double value;

public:
    ConstExpression(double value)
    {
        std::cout << value << std::endl;
        this->value = value;
    }
};

class IdentifierExpression : public Expression
{
private:
    char *name;

public:
    IdentifierExpression(char *name)
    {
        std::cout << name << std::endl;
        this->name = name;
    }
};

class AssignExpression : public Expression
{
private:
    char *name;
    Expression *value;

public:
    AssignExpression(char *name, Expression *value){
        this->name = name;
        this->value = value;
    }
};

class BinaryExpression : public Expression
{
private:
    char op;
    Expression *lhs;
    Expression *rhs;
    std::map<char, int> operatorPriority;

public:
    BinaryExpression(char op,Expression *lhs,Expression *rhs){
        this->op = op;
        this->lhs = lhs;
        this->rhs = rhs;
    }
};

class PrintExpression : public Expression
{
private:
    Expression *arg;

public:
    PrintExpression(Expression *arg){
        this->arg = arg;
    }
};

#endif