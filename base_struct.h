#ifndef BASE_STRUCT
#define BASE_STRUCT
typedef struct tasks
{
	int task_id;
	int (*f)();
} tasks_t;
#endif
