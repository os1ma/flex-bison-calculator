#pragma once

typedef enum
{
  Number,
  Expression,
} NodeType;

typedef struct Node
{
  NodeType type;
  union
  {
    struct
    {
      int value;
    } number;
    struct
    {
      struct Node *left;
      char *op;
      struct Node *right;
    } expression;
  };
} Node;

typedef Node Program;
extern Program *program;

struct Node *new_number_node(int value);
struct Node *new_expression_node(Node *left, char *op, Node *right);
