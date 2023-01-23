#include "ast.h"
#include "parse.tab.h"
#include <stdio.h>
#include <stdlib.h>

void evaluate_program(Program *program);
int evaluate_expression(Node *node);

void evaluate_program(Program *program)
{
  int result = evaluate_expression(program);
  printf("= %d\n", result);
}

int evaluate_expression(Node *node)
{
  if (node->type == Number)
  {
    return node->number.value;
  }

  return evaluate_expression(node->expression.left) +
         evaluate_expression(node->expression.right);
}

int main(void)
{
  yyparse();

  evaluate_program(program);

  return 0;
}