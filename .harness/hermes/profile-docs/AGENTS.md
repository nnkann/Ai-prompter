# Harness Hermes Agent Roles

This file is a template for profile-local role guidance. Project repositories
may keep their own `AGENTS.md`; this export only defines the Hermes-facing role
contract.

## Project-Bound Profiles

| Profile pattern | Role archetype | Gateway | Responsibility |
| --- | --- | --- | --- |
| `<abbr>_maat` | `moderator` | local config | Intake, final gate, owner-action, permission boundary checks. |
| `<abbr>_thoth` | `orchestrator` | optional local config | Task packet shaping, assignee routing, profile coordination. |
| `<abbr>_ptah` | `coder` | false | Bounded implementation inside approved task scope. |
| `<abbr>_anubis` | `reviewer` | false | AC, diff, test, regression, and handoff evidence review. |
| `<abbr>_sekhmet` | `threat-guard` | false | Gateway injection, env authority confusion, sandbox escape, secret/auth/exposure risk. |

Compatibility aliases may appear in older task packets or board records as
`<project>-maat`, `<project>-thoth`, `<project>-ptah`, `<project>-anubis`, and
`<project>-sekhmet`; orchestrators must resolve them to the concrete local
`<abbr>_*` profile names before dispatch instead of falling back arbitrarily.

## Shared Profiles

| Profile | Role archetype | Responsibility |
| --- | --- | --- |
| `seshat` | `researcher` | Official/current external evidence with freshness limits. |
| `nefertum` | `advisor` | Decision frame, trade-offs, conflict synthesis, reversal conditions. |
| `hathor` | `designer` | UI, interaction, visual coherence, accessibility proposals. |
| `hu` | `marketer` | Copy, positioning, release notes, stakeholder/channel messaging. |

Compatibility aliases such as `shared-seshat`, `shared-nefertum`,
`shared-hathor`, and `shared-hu` are accepted only as legacy references that
resolve to the unprefixed shared profiles. Shared profiles remain advisory-only
unless the task packet explicitly grants scoped implementation authority.

## Routing Rules

- `task.assignee` must be a concrete Hermes profile name or a registered local
  lane id.
- Role archetypes classify intent; they are not assignee identities.
- Shared profiles are proposal-only unless a local Hermes profile config gives
  them explicit project authority.
- AI-Prompter concrete project lanes are `ap_thoth` for orchestration,
  `ap_ptah` for scoped CLI/runtime implementation, and `ap_anubis` for prompt
  evaluation/review; shared `seshat`, `hathor`, `nefertum`, and `hu` are
  advisory-only by default.
- Task packets must preserve CPS, AC/frontmatter, allowed_scope,
  owner_approval_required, and workspace/project context guards before workers
  may mutate files.
- Direct specialists should be selected before `advisor` when there is a single
  evidence axis.
- `advisor` is used for conflict, one-way decisions, architecture trade-offs,
  CPS ambiguity, or blocked execution caused by missing judgment.
- `threat-guard` is selected for gateway, env, sandbox, workspace, auth, secret,
  cross-board, and public exposure concerns.
- Unresolved assignees must remain unresolved or blocked; no fallback profile
  may execute silently.
