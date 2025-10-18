# Jenkins ↔ GitHub Integration Issue (Multibranch Pipeline)

**Date:** 2025-10-18  
**Context:** While integrating Jenkins with GitHub for a Multibranch Pipeline (`road-to-devops` repo).

---

## 🧩 Problem

When configuring a Multibranch Pipeline using the *GitHub Branch Source Plugin*, branch indexing failed with:

```shell
Checking branch configuration/create_required_config_files
12:31:51 Jenkins-Imposed API Limiter: Current quota for Github API usage has 50 remaining (1 over budget). Next quota of 60 in 55 min. Sleeping for 3 min 58 sec.
12:31:51 Jenkins is attempting to evenly distribute GitHub API requests. To configure a different rate limiting strategy, such as having Jenkins restrict GitHub API requests only when near or above the GitHub rate limit, go to "GitHub API usage" under "Configure System" in the Jenkins settings.
ERROR: [Sat Oct 18 12:33:42 CEST 2025] Could not fetch branches from source 4fe48111-941c-45ce-8fef-1b53887a7bd8
[Sat Oct 18 12:33:42 CEST 2025] Finished branch indexing. Indexing took 1 min 53 sec
FATAL: Failed to recompute children of road-to-devops
java.lang.InterruptedException: sleep interrupted
	at java.base/java.lang.Thread.sleep0(Native Method)
	at java.base/java.lang.Thread.sleep(Thread.java:509)
	at PluginClassLoader for github-branch-source//org.jenkinsci.plugins.github_branch_source.ApiRateLimitChecker$LocalChecker.waitUntilRateLimit(ApiRateLimitChecker.java:325)
	at PluginClassLoader for github-branch-source//org.jenkinsci.plugins.github_branch_source.ApiRateLimitChecker$LocalChecker.checkRateLimit(ApiRateLimitChecker.java:271)
	at PluginClassLoader for github-branch-source//org.jenkinsci.plugins.github_branch_source.ApiRateLimitChecker$RateLimitCheckerAdapter.checkRateLimit(ApiRateLimitChecker.java:244)
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubRateLimitChecker.checkRateLimit(GitHubRateLimitChecker.java:144)
Caused: java.io.InterruptedIOException: sleep interrupted
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubRateLimitChecker.checkRateLimit(GitHubRateLimitChecker.java:158)
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubClient.sendRequest(GitHubClient.java:460)
Caused: org.kohsuke.github.HttpException: Server returned HTTP response code: -1, message: 'null' for URL: https://api.github.com/repos/cb0n3y/the-road-to-DevOps/contents/?ref=refs%2Fheads%2Fconfiguration%2Fcreate_required_config_files
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubClient.interpretApiError(GitHubClient.java:745)
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubClient.sendRequest(GitHubClient.java:480)
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubPageIterator.fetch(GitHubPageIterator.java:146)
	at PluginClassLoader for github-api//org.kohsuke.github.GitHubPageIterator.hasNext(GitHubPageIterator.java:93)
	at PluginClassLoader for github-api//org.kohsuke.github.PagedIterator.fetch(PagedIterator.java:116)
	at PluginClassLoader for github-api//org.kohsuke.github.PagedIterator.nextPageArray(PagedIterator.java:144)
	at PluginClassLoader for github-api//org.kohsuke.github.PagedIterable.toArray(PagedIterable.java:85)
	at PluginClassLoader for github-api//org.kohsuke.github.PagedIterable.toArray(PagedIterable.java:113)
	at PluginClassLoader for github-api//org.kohsuke.github.PagedIterable.toList(PagedIterable.java:125)
	at PluginClassLoader for github-api//org.kohsuke.github.GHRepository.getDirectoryContent(GHRepository.java:2730)
	at PluginClassLoader for github-branch-source//org.jenkinsci.plugins.github_branch_source.GitHubSCMProbe.stat(GitHubSCMProbe.java:140)
	at PluginClassLoader for workflow-multibranch//org.jenkinsci.plugins.workflow.multibranch.WorkflowBranchProjectFactory$1.isHead(WorkflowBranchProjectFactory.java:74)
	at PluginClassLoader for scm-api//jenkins.scm.api.trait.SCMSourceRequest.process(SCMSourceRequest.java:342)
	at PluginClassLoader for scm-api//jenkins.scm.api.trait.SCMSourceRequest.process(SCMSourceRequest.java:249)
	at PluginClassLoader for github-branch-source//org.jenkinsci.plugins.github_branch_source.GitHubSCMSource.retrieve(GitHubSCMSource.java:1084)
	at PluginClassLoader for scm-api//jenkins.scm.api.SCMSource._retrieve(SCMSource.java:372)
	at PluginClassLoader for scm-api//jenkins.scm.api.SCMSource.fetch(SCMSource.java:282)
	at PluginClassLoader for branch-api//jenkins.branch.MultiBranchProject.computeChildren(MultiBranchProject.java:660)
	at PluginClassLoader for cloudbees-folder//com.cloudbees.hudson.plugins.folder.computed.ComputedFolder.updateChildren(ComputedFolder.java:272)
	at PluginClassLoader for cloudbees-folder//com.cloudbees.hudson.plugins.folder.computed.FolderComputation.run(FolderComputation.java:170)
	at PluginClassLoader for branch-api//jenkins.branch.MultiBranchProject$BranchIndexing.run(MultiBranchProject.java:1063)
	at hudson.model.ResourceController.execute(ResourceController.java:101)
	at hudson.model.Executor.run(Executor.java:460)
Finished: FAILURE
```


Jenkins could not list branches or pull requests and hit GitHub API rate limits.

---

## 🧠 Root Cause

Jenkins’ **GitHub Branch Source Plugin** still authenticates via the **classic GitHub API (v3)**,  
which only supports **basic authentication (username + PAT)**.  
Fine-grained personal access tokens or “secret text” credentials are **not compatible** with this plugin.

---

## 🛠️ Solution

1. **Create a Classic GitHub PAT**
   - Go to: `GitHub → Settings → Developer Settings → Personal access tokens (classic)`
   - Enable scopes:
     - `repo`
     - `read:org` (if repo belongs to an org)
     - `admin:repo_hook` (optional, for webhook automation)

2. **Add Jenkins Credential**
   - Type: `Username with password`
   - Username: your GitHub username (`cb0n3y`)
   - Password: the classic PAT
   - ID: `github-classic-token`

3. **Link Credential in Jenkins**
   - Go to your Multibranch Pipeline configuration
   - Under *Branch Sources → GitHub → Credentials*, select `github-classic-token`
   - Save and click **Scan Repository Now**

✅ Jenkins successfully scanned all branches and pull requests.

---

## 💡 Notes
- Fine-grained tokens can be used later through **GitHub App** integration.
- The “repo” scope is mandatory for private repositories.
- To improve API quota and security, consider migrating to a GitHub App in the future.

---

**Tags:** `#jenkins` `#github` `#multibranch` `#integration` `#troubleshooting`

---

## 🏆 Lessons Learned
- Jenkins Multibranch Pipelines still require **classic PAT + username** for private repos.
- Fine-grained tokens are not supported yet by the plugin.
- Always check API quotas to avoid indexing failures.
- Consider documenting credentials strategy and token expiration for future maintenance.
