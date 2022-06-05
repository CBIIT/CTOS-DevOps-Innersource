resource "aws_config_config_rule" "ecs_containers_nonprivileged" {
  name        = "ecs-containers-nonprivileged"
  description = "Checks if Amazon Elastic Container Service (Amazon ECS) Containers only have read-only access to its root filesystems. The rule is NON_COMPLIANT if the readonlyRootFilesystem parameter in the container definition of ECSTaskDefinitions is set to ‘false’."

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINERS_NONPRIVILEGED"
  }
}

resource "aws_config_config_rule" "ecs_containers_readonly_access" {
  name        = "ecs-containers-readonly-access"
  description = "Checks if Amazon Elastic Container Service clusters have container insights enabled. The rule is NON_COMPLIANT if container insights are not enabled."

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINERS_READONLY_ACCESS"
  }
}

resource "aws_config_config_rule" "ecs_container_insights_enabled" {
  name        = "ecs-container-insights-enabled"
  description = ""

  source {
    owner             = "AWS"
    source_identifier = "ECS_CONTAINER_INSIGHTS_ENABLED"
  }
}

resource "aws_config_config_rule" "ecs_fargate_latest_platform_version" {
  name        = "ecs-fargate-latest-platform-version"
  description = "Checks if Amazon Elastic Container Service (ECS) Fargate Services is running on the latest Fargate platform version. The rule is NON_COMPLIANT if ECS Service platformVersion not set to LATEST."

  source {
    owner             = "AWS"
    source_identifier = "ECS_FARGATE_LATEST_PLATFORM_VERSION"
  }
}

resource "aws_config_config_rule" "ecs_no_environment_secrets" {
  name        = "ecs-no-environment-secrets"
  description = "Checks if secrets are passed as container environment variables. The rule is NON_COMPLIANT if 1 or more environment variable key matches a key listed in the 'secretKeys' parameter (excluding environmental variables from other locations such as Amazon S3)."

  source {
    owner             = "AWS"
    source_identifier = "ECS_NO_ENVIRONMENT_SECRETS"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_memory_hard_limit" {
  name        = "ecs-task-definition-memory-hard-limit"
  description = "Checks if Amazon Elastic Container Service (ECS) task definitions have a set memory limit for its container definitions. The rule is NON_COMPLIANT for a task definition if the ‘memory’ parameter is absent for one container definition."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_MEMORY_HARD_LIMIT"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_nonroot_user" {
  name        = "ecs-task-definition-nonroot-user"
  description = "Checks if ECSTaskDefinitions specify a user for Amazon Elastic Container Service (Amazon ECS) EC2 launch type containers to run on. The rule is NON_COMPLIANT if the ‘user’ parameter is not present or set to ‘root’."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_NONROOT_USER"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_pid_mode_check" {
  name        = "ecs-task-definition-pid-mode-check"
  description = "Checks if ECSTaskDefinitions are configured to share a host’s process namespace with its Amazon Elastic Container Service (Amazon ECS) containers. The rule is NON_COMPLIANT if the pidMode parameter is set to ‘host’."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_PID_MODE_CHECK"
  }
}

resource "aws_config_config_rule" "ecs_task_definition_user_for_host_mode_check" {
  name        = "ecs-task-definition-user-for-host-mode-check"
  description = "Checks if an Amazon Elastic Container Service (Amazon ECS) task definition with host networking mode has 'privileged' or 'user' container definitions. The rule is NON_COMPLIANT for task definitions with host network mode and container definitions of privileged=false or empty and user=root or empty."

  source {
    owner             = "AWS"
    source_identifier = "ECS_TASK_DEFINITION_USER_FOR_HOST_MODE_CHECK"
  }
}

