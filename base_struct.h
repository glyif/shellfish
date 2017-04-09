#ifndef BASE_STRUCT
#define BASE_STRUCT
/**
 * struct tasks - tasks to match number with checker
 * @task_id: task number
 * @f: function
 */
typedef struct tasks
{
	int task_id;
	int (*f)();
} tasks_t;
#endif
