output "jenkins_host" {
  value = data.aws_instance.jenkins_host.iam_instance_profile
}