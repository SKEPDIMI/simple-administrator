# Simple administrator

This markdown documents the most important features of simple-administrator. Use it as a guide to understand better how the application is expected to function, and how you can get the best out of it.

## Roles
Roles specify what actions certain users can perform on specified information. For example, an administrator can manipulate all data on the application, while a superintendent can create workers, a project manager can change a job's superintendent and logged out users cannot view any of the application's data. There are 3 explicit roles:

### Admin (1)
Admins have control over all data on the application. They are responsible for creating `permission_code`s. **Admins have control over all data on the database** and **Admins cannot manipulate other admins**, meaning an admin cannot destroy or update another admin UNLESS they are the same user. 

IMPORTANT: **Admins can create/view/update and destroy all data on the application** (for sake of redundancy this is being stated only once _here_, and it is expected this fact is kept in mind at all times)

### Project Manager (2)
Project managers have the ability to create jobs, tasks, subcontractors and workers. Subcontractors cannot, however, manipulate jobs that do not specify that they are indeed the job's manager. This means project managers cannot manipulate other manager's jobs UNLESS it is specified the job's manager is themselves. **A job's manager can also be changed by admins,** along with the rest of the job's data.

### Superintendent (3)
Superintendents have the ability to read a job's data (and that which is associated to it) and create `tasks` for jobs that specify they are the superintendent for. Superintendents also have the ability to create/manipulate `subcontractors` and `workers` at will. Subcontractors can be set and changed to a specified job by the respective project manager.

## Models
Models are logical interfaces with which you can interact with your data, like users, jobs and subcontractors. They all each have different properties like `first_name`s and `titles`

### Permission codes
Permission codes are created by administrators, and are using in order to let other users create accounts (*admins do not need permission codes to create users*). A permission code will contain a `role` and `body` will be the actual code, while `role` will specify the role the user utilizing this code will be. Only administrators can create, read, update and destroy permission codes. Permission codes will be destroyed once they have been used once to create an account.

### User
Users hold information of an account that makes use of the application, such as `role`, `first name`, `last name`, `email` and `phone`.

#### Creation
In order for a person that is not an admin to create a user, **they must be provided a permission code** in order for them to prove they have permission to view/manipulate* data on the application
#### Viewing
Users can view their own accounts freely, but cannot view accounts of other users
#### Updating
Users can update their own accounts freely, but cannot update accounts of other users
#### Destroying
Users can destroy their own accounts freely, but cannot destroy accounts of other users

### Jobs
Jobs hold the basic information about a specific job and **data associated to it such as `tasks` and `subcontractors`**. Jobs hold the following properties: `title`, `start_date`, `end_date`, `subcontractor`, `project manager`. **A job's data can NOT be viewed(or manipulated) by users that are not associated to the job (i.e are not the manager or superintendent)**.

A job's `project manager` will have control over all of it's data and that which is associated to it. For example, a project manager will be able to create a job (aswell as update/delete it) and all of the tasks and subcontractors that might be associated to it. **Project managers are like the admins of jobs (not surprisingly)**
A job's `superintendent` is set by the job's project manager. They will have the ability to create tasks, subcontractors and workers which will be tied to the respective job.

#### Creation
A job can be created by a user with a project manager role
#### Viewing
A job can be viewed by users associated to it (superintendent and project manager)
#### Updating
The updating of the actual job can only be done by the project manager of the _specified_ job. Again, superintendents of a job can be changed by the project manager (and project managers can be changed by admins)
#### Destroying
Jobs can be destroyed by the project manager. **This will destroy all tasks associated with the job**

### Tasks
Tasks _bind together the world of jobs and subcontractors in a way they can live in a harmonious way_ (Atleast that is a nice way to put it). Tasks are smaller jobs that are carried out by a subcontractor for a job. In this way, a job will have many subcontractors working for them, and subcontractors will have many tasks to work. Tasks have the following properties: `title`, `subcontractor` and `job`.

#### Creation
Tasks can be created for a job by it's project manager or superintendent. A task must have a job and subcontractor specified to it.
#### Viewing
Tasks of a job can be viewed by it's project manager or superintendent. Tasks cannot be viewed across jobs, so the superintendent of a construction job wont be seeing the tasks of a software job (unless they also work in the software job and look in all of _his_ tasks).
#### Updating
Tasks can be updated for a job by it's project manager or superintendent.
#### Destroying
Tasks can be destroyed for a job by it's project manager or superintendent.

### Subcontractors
Subcontractors represent the data of a real life subcontractor, and each have different tasks associated to them. **Tasks connect a subcontractor to job just like tasks connect jobs to subcontractors**. Subcontractors have `name` property and a collection of tasks (tasks are added to a subcontractor when a task is created) Subcontractors are not users, they cannot be logged into, they are just representations. Subcontractors also have workers associated to them.

#### Creation / Viewing / Updating / Destruction
Subcontractors can be created/manipulated by any user and can be used in any task. For example, the subcontractor by the name "Programmers.inc" can be used in the job "Build software for school" aswell as the job "Make mobile app".

### Workers
Workers are also representations of data. Workers are similar to users in their properties: `first name`, `last name`, `pay`, `subcontractor`. Workers belong to subcontractors, and subcontractors have many workers

### Creation / Viewing / Updating / Destruction
Workers, just like subcontractors can be created/manipulated by all users and are used across the application

## Further documentation
Any details that might have been left out can be issued and will be attended as soon as possible.

- skepdimi
