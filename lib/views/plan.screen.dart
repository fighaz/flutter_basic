import 'package:flutter_basic/provider/plan_provide.dart';
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plan.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Find the current plan from the list of plans
          final currentPlan = plans.firstWhere(
            (p) => p.name == widget.plan.name,
            orElse: () => widget.plan,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final plans = planNotifier.value;
        final planIndex = plans.indexWhere((p) => p.name == widget.plan.name);

        if (planIndex != -1) {
          final currentPlan = plans[planIndex];
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..add(const Task());

          final updatedPlan = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );

          final updatedPlans = List<Plan>.from(plans)
            ..[planIndex] = updatedPlan;
          planNotifier.value = updatedPlans;
        }
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(
        plan.tasks[index],
        index,
        context,
      ),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == widget.plan.name);

          if (planIndex != -1) {
            final currentPlan = plans[planIndex];
            final updatedTasks = List<Task>.from(currentPlan.tasks);
            updatedTasks[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );

            final updatedPlan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );

            final updatedPlans = List<Plan>.from(plans)
              ..[planIndex] = updatedPlan;
            planNotifier.value = updatedPlans;
          }
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == widget.plan.name);

          if (planIndex != -1) {
            final currentPlan = plans[planIndex];
            final updatedTasks = List<Task>.from(currentPlan.tasks);
            updatedTasks[index] = Task(
              description: text,
              complete: task.complete,
            );

            final updatedPlan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );

            final updatedPlans = List<Plan>.from(plans)
              ..[planIndex] = updatedPlan;
            planNotifier.value = updatedPlans;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
