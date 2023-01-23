#include "ast.h"

#include <stdlib.h>

Program *program;

Node *new_number_node(int value)
{
  Node *node = calloc(sizeof(Node), 1);
  node->type = Number;
  node->number.value = value;
  return node;
}

Node *new_expression_node(Node *left, char *op, Node *right)
{
  Node *node = calloc(sizeof(Node), 1);
  node->type = Expression;
  node->expression.left = left;
  node->expression.op = op;
  node->expression.right = right;
  return node;
}