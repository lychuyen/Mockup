The Complete Guide
to Building Skills
for Claude
Contents

Introduction                  3

Fundamentals                  4

Planning and design           7

Testing and iteration         14

Distribution and sharing      18

Patterns and troubleshooting  21

Resources and references      28

                                  2
Introduction

A skill is a set of instructions - packaged as a simple folder - that teaches Claude  Two Paths Through This Guide
how to handle specific tasks or workflows. Skills are one of the most powerful        Building standalone skills? Focus on Fundamentals, Planning and Design, and
ways to customize Claude for your specific needs. Instead of re-explaining your       category 1-2. Enhancing an MCP integration? The "Skills + MCP" section and
preferences, processes, and domain expertise in every conversation, skills let you    category 3 are for you. Both paths share the same technical requirements, but
teach Claude once and benefit every time.                                             you choose what's relevant to your use case.

Skills are powerful when you have repeatable workflows: generating frontend           What you'll get out of this guide: By the end, you'll be able to build a functional
designs from specs, conducting research with consistent methodology, creating         skill in a single sitting. Expect about 15-30 minutes to build and test your first
documents that follow your team's style guide, or orchestrating multi-step            working skill using the skill-creator.
processes. They work well with Claude's built-in capabilities like code execution
and document creation. For those building MCP integrations, skills add another        Let's get started.
powerful layer helping turn raw tool access into reliable, optimized workflows.

This guide covers everything you need to know to build effective skills - from
planning and structure to testing and distribution. Whether you're building a
skill for yourself, your team, or for the community, you'll find practical patterns
and real-world examples throughout.

What you'll learn:
· Technical requirements and best practices for skill structure
· Patterns for standalone skills and MCP-enhanced workflows
· Patterns we've seen work well across different use cases
· How to test, iterate, and distribute your skills

Who this is for:
· Developers who want Claude to follow specific workflows consistently
· Power users who want Claude to follow specific workflows
· Teams looking to standardize how Claude works across their organization
  Chapter 1

Fundamentals

                                                                                                                                                                                                                                                                                                      4
  Chapter 1

Fundamentals

What is a skill?                                                                   Composability

A skill is a folder containing:                                                    Claude can load multiple skills simultaneously. Your skill should work well
· SKILL.md (required): Instructions in Markdown with YAML frontmatter              alongside others, not assume it's the only capability available.
· scripts/ (optional): Executable code (Python, Bash, etc.)
· references/ (optional): Documentation loaded as needed                           Portability
· assets/ (optional): Templates, fonts, icons used in output
                                                                                   Skills work identically across Claude.ai, Claude Code, and API. Create a skill once
Core design principles                                                             and it works across all surfaces without modification, provided the environment
                                                                                   supports any dependencies the skill requires.
Progressive Disclosure
                                                                                   For MCP Builders: Skills + Connectors
Skills use a three-level system:
· First level (YAML frontmatter): Always loaded in Claude's system prompt.          Building standalone skills without MCP? Skip to Planning and Design - you can

   Provides just enough information for Claude to know when each skill should      always return here later.
   be used without loading all of it into context.
· Second level (SKILL.md body): Loaded when Claude thinks the skill is             If you already have a working MCP server, you've done the hard part. Skills are
   relevant to the current task. Contains the full instructions and guidance.      the knowledge layer on top - capturing the workflows and best practices you
· Third level (Linked files): Additional files bundled within the skill directory  already know, so Claude can apply them consistently.
   that Claude can choose to navigate and discover only as needed.
                                                                                   The kitchen analogy
This progressive disclosure minimizes token usage while maintaining
specialized expertise.                                                             MCP provides the professional kitchen: access to tools, ingredients, and
                                                                                   equipment.

                                                                                   Skills provide the recipes: step-by-step instructions on how to create something
                                                                                   valuable.

                                                                                   5
Together, they enable users to accomplish complex tasks without needing to
figure out every step themselves.

How they work together:

MCP (Connectivity)                       Skills (Knowledge)

Connects Claude to your service          Teaches Claude how to use your service
(Notion, Asana, Linear, etc.)            effectively

Provides real-time data access and tool  Captures workflows and best practices
invocation

What Claude can do                       How Claude should do it

Why this matters for your MCP users

Without skills:

· Users connect your MCP but don't know what to do next
· Support tickets asking "how do I do X with your integration"
· Each conversation starts from scratch
· Inconsistent results because users prompt differently each time
· Users blame your connector when the real issue is workflow guidance

With skills:

· Pre-built workflows activate automatically when needed
· Consistent, reliable tool usage
· Best practices embedded in every interaction
· Lower learning curve for your integration

                                                                                 6
  Chapter 2

Planning and design

                                                                                                                                                                                                                                                                                                      7
  Chapter 2

Planning and design

Start with use cases                                                                Common skill use case categories

Before writing any code, identify 2-3 concrete use cases your skill should enable.  At Anthropic, we've observed three common use cases:

Good use case definition:                                                           Category 1: Document & Asset Creation

     Use Case: Project Sprint Planning                                              Used for: Creating consistent, high-quality output including documents,
     Trigger: User says "help me plan this sprint" or "create                       presentations, apps, designs, code, etc.
     sprint tasks"
     Steps:                                                                         Real example: frontend-design skill (also see skills for docx, pptx, xlsx, and
     1. Fetch current project status from Linear (via MCP)                          ppt)
     2. Analyze team velocity and capacity
     3. Suggest task prioritization                                                 "Create distinctive, production-grade frontend interfaces with high design
     4. Create tasks in Linear with proper labels and estimates                     quality. Use when building web components, pages, artifacts, posters, or
     Result: Fully planned sprint with tasks created                                applications."

Ask yourself:                                                                       Key techniques:
                                                                                    · Embedded style guides and brand standards
· What does a user want to accomplish?                                              · Template structures for consistent output
· What multi-step workflows does this require?                                      · Quality checklists before finalizing
· Which tools are needed (built-in or MCP?)                                         · No external tools required - uses Claude's built-in capabilities
· What domain knowledge or best practices should be embedded?

                                                                                                                                                                    8
Category 2: Workflow Automation                                                 Define success criteria

Used for: Multi-step processes that benefit from consistent methodology,        How will you know your skill is working?
including coordination across multiple MCP servers.
Real example: skill-creator skill                                               These are aspirational targets - rough benchmarks rather than precise
"Interactive guide for creating new skills. Walks the user through use case     thresholds. Aim for rigor but accept that there will be an element of vibes-based
definition, frontmatter generation, instruction writing, and validation."       assessment. We are actively developing more robust measurement guidance and
                                                                                tooling.
Key techniques:
· Step-by-step workflow with validation gates                                   Quantitative metrics:
· Templates for common structures
· Built-in review and improvement suggestions                                   · Skill triggers on 90% of relevant queries
· Iterative refinement loops                                                       ­ How to measure: Run 10-20 test queries that should trigger your skill. Track
                                                                                      how many times it loads automatically vs. requires explicit invocation.
Category 3: MCP Enhancement
                                                                                · Completes workflow in X tool calls
Used for: Workflow guidance to enhance the tool access an MCP server provides.     ­ How to measure: Compare the same task with and without the skill enabled.
Real example: sentry-code-review skill (from Sentry)                                  Count tool calls and total tokens consumed.
"Automatically analyzes and fixes detected bugs in GitHub Pull Requests using
Sentry's error monitoring data via their MCP server."                           · 0 failed API calls per workflow
                                                                                   ­ How to measure: Monitor MCP server logs during test runs. Track retry rates
Key techniques:                                                                       and error codes.
· Coordinates multiple MCP calls in sequence
· Embeds domain expertise                                                       Qualitative metrics:
· Provides context users would otherwise need to specify
· Error handling for common MCP issues                                          · Users don't need to prompt Claude about next steps
                                                                                   ­ How to assess: During testing, note how often you need to redirect or clarify.
                                                                                      Ask beta users for feedback.

                                                                                · Workflows complete without user correction
                                                                                   ­ How to assess: Run the same request 3-5 times. Compare outputs for
                                                                                      structural consistency and quality.

                                                                                · Consistent results across sessions
                                                                                   ­ How to assess: Can a new user accomplish the task on first try with minimal
                                                                                      guidance?

                                                                                9
Technical requirements                                                           YAML frontmatter: The most important part

File structure                                                                   The YAML frontmatter is how Claude decides whether to load your skill. Get this
                                                                                 right.
your-skill-name/
                                                                                 Minimal required format
 SKILL.md         # Required - main skill file
                                                                                      ---
 scripts/         # Optional - executable code                                        name: your-skill-name
                                                                                      description: What it does. Use when user asks to [specific
  process_data.py # Example                                                           phrases].
                                                                                      ---
  validate.sh # Example
                                                                                 That's all you need to start.
 references/      # Optional - documentation
                                                                                 Field requirements
  api-guide.md # Example
                                                                                 name (required):
  examples/ # Example                                                            · kebab-case only
                                                                                 · No spaces or capitals
 assets/          # Optional - templates, etc.                                   · Should match folder name
                                                                                 description (required):
 report-template.md # Example                                                    · MUST include BOTH:

Critical rules                                                                      ­ What the skill does
                                                                                    ­ When to use it (trigger conditions)
SKILL.md naming:                                                                 · Under 1024 characters
· Must be exactly SKILL.md (case-sensitive)                                      · No XML tags (< or >)
· No variations accepted (SKILL.MD, skill.md, etc.)                              · Include specific tasks users might say
                                                                                 · Mention file types if relevant
Skill folder naming:
                                                                                                                                                                                                                             10
 · Use kebab-case: notion-project-setup
 · No spaces: Notion Project Setup
 · No underscores: notion_project_setup
 · No capitals: NotionProjectSetup

No README.md:
· Don't include README.md inside your skill folder
· All documentation goes in SKILL.md or references/
· Note: when distributing via GitHub, you'll still want a repo-level README for

   human users -- see Distribution and Sharing.
license (optional):                                                           Writing effective skills
· Use if making skill open source
· Common: MIT, Apache-2.0                                                     The description field

compatibility (optional)                                                      According to Anthropic's engineering blog: "This metadata...provides just
· 1-500 characters                                                            enough information for Claude to know when each skill should be used without
· Indicates environment requirements: e.g. intended product, required system  loading all of it into context." This is the first level of progressive disclosure.

   packages, network access needs, etc.                                       Structure:

metadata (optional):                                                               [What it does] + [When to use it] + [Key capabilities]
· Any custom key-value pairs
· Suggested: author, version, mcp-server                                      Examples of good descriptions:
· Example:
                                                                                   # Good - specific and actionable
   ```yaml                                                                         description: Analyzes Figma design files and generates
   metadata:                                                                       developer handoff documentation. Use when user uploads .fig
                                                                                   files, asks for "design specs", "component documentation", or
            author: ProjectHub                                                     "design-to-code handoff".
            version: 1.0.0 mcp-server: projecthub
   ```                                                                             # Good - includes trigger phrases
                                                                                   description: Manages Linear project workflows including sprint
Security restrictions                                                              planning, task creation, and status tracking. Use when user
                                                                                   mentions "sprint", "Linear tasks", "project planning", or asks
Forbidden in frontmatter:                                                          to "create tickets".
· XML angle brackets (< >)
· Skills with "claude" or "anthropic" in name (reserved)                           # Good - clear value proposition
                                                                                   description: End-to-end customer onboarding workflow for
Why: Frontmatter appears in Claude's system prompt. Malicious content could        PayFlow. Handles account creation, payment setup, and
inject instructions.                                                               subscription management. Use when user says "onboard new
                                                                                   customer", "set up subscription", or "create PayFlow account".

                                                                                                                                                                   11
Examples of bad descriptions:                                                           Example:
                                                                                        ```bash
     # Too vague                                                                        python scripts/fetch_data.py --project-id PROJECT_ID
     description: Helps with projects.                                                  Expected output: [describe what success looks like]

     # Missing triggers                                                            (Add more steps as needed)
     description: Creates sophisticated multi-page documentation
     systems.                                                                      Examples

     # Too technical, no user triggers                                             Example 1: [common scenario]
     description: Implements the Project entity model with
     hierarchical relationships.                                                   User says: "Set up a new marketing campaign"
                                                                                   Actions:
Writing the main instructions                                                      1. Fetch existing campaigns via MCP
                                                                                   2. Create new campaign with provided parameters
After the frontmatter, write the actual instructions in Markdown.                  Result: Campaign created with confirmation link
                                                                                   (Add more examples as needed)
Recommended structure:
Adapt this template for your skill. Replace bracketed sections with your specific  Troubleshooting
content.
                                                                                   Error: [Common error message]
     ---
     name: your-skill                                                              Cause: [Why it happens]
     description: [...]                                                            Solution: [How to fix]
     ---                                                                           (Add more error cases as needed)

     # Your Skill Name

     ## Instructions

     ### Step 1: [First Major Step]
     Clear explanation of what happens.

                                                                                                                                              12
Best Practices for Instructions                                     Reference bundled resources clearly

Be Specific and Actionable                                               Before writing queries, consult `references/api-patterns.md`
                                                                         for:
 Good:                                                                   - Rate limiting guidance
                                                                         - Pagination patterns
     Run `python scripts/validate.py --input {filename}` to check        - Error codes and handling
     data format.
     If validation fails, common issues include:                    Use progressive disclosure
     - Missing required fields (add them to the CSV)                Keep SKILL.md focused on core instructions. Move detailed documentation to
     - Invalid date formats (use YYYY-MM-DD)                        `references/` and link to it. (See Core Design Principles for how the three-
                                                                    level system works.)
 Bad:

     Validate the data before proceeding.

Include error handling

     ## Common Issues

     ### MCP Connection Failed
     If you see "Connection refused":
     1. Verify MCP server is running: Check Settings > Extensions
     2. Confirm API key is valid
     3. Try reconnecting: Settings > Extensions > [Your Service] >
     Reconnect

                                                                                                                                                  13
  Chapter 3

Testing and iteration

                                                                                                                                                                                                                                                                                                     14
  Chapter 3

Testing and iteration

Skills can be tested at varying levels of rigor depending on your needs:            Recommended Testing Approach
· Manual testing in Claude.ai - Run queries directly and observe behavior. Fast
                                                                                    Based on early experience, effective skills testing typically covers three areas:
   iteration, no setup required.
· Scripted testing in Claude Code - Automate test cases for repeatable              1. Triggering tests

   validation across changes.                                                       Goal: Ensure your skill loads at the right times.
· Programmatic testing via skills API - Build evaluation suites that run
                                                                                    Test cases:
   systematically against defined test sets.
                                                                                     · Triggers on obvious tasks
Choose the approach that matches your quality requirements and the visibility        · Triggers on paraphrased requests
of your skill. A skill used internally by a small team has different testing needs   · Doesn't trigger on unrelated topics
than one deployed to thousands of enterprise users.
                                                                                    Example test suite:
    Pro Tip: Iterate on a single task before expanding
                                                                                         Should trigger:
We've found that the most effective skill creators iterate on a single challenging       - "Help me set up a new ProjectHub workspace"
task until Claude succeeds, then extract the winning approach into a skill. This         - "I need to create a project in ProjectHub"
leverages Claude's in-context learning and provides faster signal than broad             - "Initialize a ProjectHub project for Q4 planning"
testing. Once you have a working foundation, expand to multiple test cases for
coverage.                                                                                Should NOT trigger:
                                                                                         - "What's the weather in San Francisco?"
                                                                                         - "Help me write Python code"
                                                                                         - "Create a spreadsheet" (unless ProjectHub skill handles
                                                                                         sheets)

                                                                                                                                                                       15
2. Functional tests                                                                With skill:
                                                                                   - Automatic workflow execution
Goal: Verify the skill produces correct outputs.                                   - 2 clarifying questions only
                                                                                   - 0 failed API calls
Test cases:                                                                        - 6,000 tokens consumed
· Valid outputs generated
· API calls succeed                                                           Using the skill-creator skill
· Error handling works
· Edge cases covered                                                          The skill-creator skill - available in Claude.ai via plugin directory or
                                                                              download for Claude Code - can help you build and iterate on skills. If you
Example:                                                                      have an MCP server and know your top 2­3 workflows, you can build and test a
                                                                              functional skill in a single sitting - often in 15­30 minutes.
     Test: Create project with 5 tasks                                        Creating skills:
     Given: Project name "Q4 Planning", 5 task descriptions                   · Generate skills from natural language descriptions
     When: Skill executes workflow                                            · Produce properly formatted SKILL.md with frontmatter
     Then:                                                                    · Suggest trigger phrases and structure
                                                                              Reviewing skills:
        - Project created in ProjectHub                                       · Flag common issues (vague descriptions, missing triggers, structural
        - 5 tasks created with correct properties
        - All tasks linked to project                                            problems)
        - No API errors                                                       · Identify potential over/under-triggering risks
                                                                              · Suggest test cases based on the skill's stated purpose
3. Performance comparison                                                     Iterative improvement:
                                                                              · After using your skill and encountering edge cases or failures, bring those
Goal: Prove the skill improves results vs. baseline.
                                                                                 examples back to skill-creator
Use the metrics from Define Success Criteria. Here's what a comparison might  · Example: "Use the issues & solution identified in this chat to improve how the
look like.
                                                                                 skill handles [specific edge case]"
Baseline comparison:
                                                                                                                                                                                                                          16
     Without skill:
     - User provides instructions each time
     - 15 back-and-forth messages
     - 3 failed API calls requiring retry
     - 12,000 tokens consumed
To use:                                                                         Execution issues:
                                                                                · Inconsistent results
     "Use the skill-creator skill to help me build a skill for                  · API call failures
     [your use case]"                                                           · User corrections needed

Note: skill-creator helps you design and refine skills but does not execute         Solution: Improve instructions, add error handling
automated test suites or produce quantitative evaluation results.

Iteration based on feedback

Skills are living documents. Plan to iterate based on:
Undertriggering signals:
· Skill doesn't load when it should
· Users manually enabling it
· Support questions about when to use it

    Solution: Add more detail and nuance to the description - this may include
    keywords particularly for technical terms

Overtriggering signals:
· Skill loads for irrelevant queries
· Users disabling it
· Confusion about purpose

    Solution: Add negative triggers, be more specific

                                                                                                                                        17
  Chapter 4

Distribution and
sharing

                                                                                                                                                                                                                                                                                                     18
  Chapter 4

Distribution and sharing

Skills make your MCP integration more complete. As users compare connectors,        Using skills via API
those with skills offer a faster path to value, giving you an edge over MCP-only
alternatives.                                                                       For programmatic use cases - such as building applications, agents, or automated
                                                                                    workflows that leverage skills - the API provides direct control over skill
Current distribution model (January 2026)                                           management and execution.

How individual users get skills:                                                    Key capabilities:

1. Download the skill folder                                                        · `/v1/skills` endpoint for listing and managing skills
2. Zip the folder (if needed)                                                       · Add skills to Messages API requests via the `container.skills` parameter
3. Upload to Claude.ai via Settings > Capabilities > Skills                         · Version control and management through the Claude Console
4. Or place in Claude Code skills directory                                         · Works with the Claude Agent SDK for building custom agents

Organization-level skills:                                                          When to use skills via the API vs. Claude.ai:

· Admins can deploy skills workspace-wide (shipped December 18, 2025)               Use Case                                         Best Surface
· Automatic updates                                                                 End users interacting with skills directly       Claude.ai / Claude Code
· Centralized management                                                            Manual testing and iteration during development  Claude.ai / Claude Code
                                                                                    Individual, ad-hoc workflows                     Claude.ai / Claude Code
An open standard                                                                    Applications using skills programmatically       API
                                                                                    Production deployments at scale                  API
We've published Agent Skills as an open standard. Like MCP, we believe skills       Automated pipelines and agent systems            API
should be portable across tools and platforms - the same skill should work
whether you're using Claude or other AI platforms. That said, some skills are
designed to take full advantage of a specific platform's capabilities; authors can
note this in the skill's compatibility field. We've been collaborating with
members of the ecosystem on the standard, and we're excited by early adoption.

                                                                                                                                                              19
Note: Skills in the API require the Code Execution Tool beta, which provides the          - Select the skill folder (zipped)
secure environment skills need to run.
                                                                                     3. Enable the skill:
For implementation details, see:                                                          - Toggle on the [Your Service] skill
· Skills API Quickstart                                                                   - Ensure your MCP server is connected
· Create Custom skills
· Skills in the Agent SDK                                                            4. Test:
                                                                                          - Ask Claude: "Set up a new project in [Your Service]"

Recommended approach today                                                           Positioning your skill

Start by hosting your skill on GitHub with a public repo, clear README (for          How you describe your skill determines whether users understand its value and
human visitors -- this is separate from your skill folder, which should not contain  actually try it. When writing about your skill--in your README, documentation,
a README.md), and example usage with screenshots. Then add a section                 or marketing - keep these principles in mind.
to your MCP documentation that links to the skill, explains why using both
together is valuable, and provides a quick-start guide.                              Focus on outcomes, not features:

1. Host on GitHub                                                                     Good:

   ­ Public repo for open-source skills                                                   "The ProjectHub skill enables teams to set up complete project
   ­ Clear README with installation instructions                                          workspaces in seconds -- including pages, databases, and
   ­ Example usage and screenshots                                                        templates -- instead of spending 30 minutes on manual setup."

2. Document in Your MCP Repo                                                          Bad:

   ­ Link to skills from MCP documentation                                                "The ProjectHub skill is a folder containing YAML frontmatter
   ­ Explain the value of using both together                                             and Markdown instructions that calls our MCP server tools."
   ­ Provide quick-start guide
                                                                                     Highlight the MCP + skills story:
3. Create an Installation Guide
                                                                                          "Our MCP server gives Claude access to your Linear projects.
     ## Installing the [Your Service] skill                                               Our skills teach Claude your team's sprint planning workflow.
                                                                                          Together, they enable AI-powered project management."
     1. Download the skill:
          - Clone repo: `git clone https://github.com/yourcompany/                                                                                                                                                              20
              skills`
          - Or download ZIP from Releases

     2. Install in Claude:
          - Open Claude.ai > Settings > skills
          - Click "Upload skill"
  Chapter 5

Patterns and
troubleshooting

                                                                                                                                                                                                                                                                                                     21
  Chapter 5

Patterns and troubleshooting

These patterns emerged from skills created by early adopters and internal teams.  Pattern 1: Sequential workflow orchestration
They represent common approaches we've seen work well, not prescriptive
templates.                                                                        Use when: Your users need multi-step processes in a specific order.

Choosing your approach: Problem-first vs. tool-first                              Example structure:

Think of it like Home Depot. You might walk in with a problem - "I need to fix a       ## Workflow: Onboard New Customer
kitchen cabinet" - and an employee points you to the right tools. Or you might
pick out a new drill and ask how to use it for your specific job.                      ### Step 1: Create Account
                                                                                       Call MCP tool: `create_customer`
Skills work the same way:                                                              Parameters: name, email, company
· Problem-first: "I need to set up a project workspace"  Your skill orchestrates
                                                                                       ### Step 2: Setup Payment
   the right MCP calls in the right sequence. Users describe outcomes; the skill       Call MCP tool: `setup_payment_method`
   handles the tools.                                                                  Wait for: payment method verification
· Tool-first: "I have Notion MCP connected"  Your skill teaches Claude the
   optimal workflows and best practices. Users have access; the skill provides         ### Step 3: Create Subscription
   expertise.                                                                          Call MCP tool: `create_subscription`
                                                                                       Parameters: plan_id, customer_id (from Step 1)
Most skills lean one direction. Knowing which framing fits your use case helps
you choose the right pattern below.                                                    ### Step 4: Send Welcome Email
                                                                                       Call MCP tool: `send_email`
                                                                                       Template: welcome_email_template

                                                                                  Key techniques:
                                                                                  · Explicit step ordering
                                                                                  · Dependencies between steps
                                                                                  · Validation at each stage
                                                                                  · Rollback instructions for failures

                                                                                                                                                                                                                             22
Pattern 2: Multi-MCP coordination                Pattern 3: Iterative refinement

Use when: Workflows span multiple services.      Use when: Output quality improves with iteration.

Example: Design-to-development handoff           Example: Report generation

     ### Phase 1: Design Export (Figma MCP)           ## Iterative Report Creation
     1. Export design assets from Figma
     2. Generate design specifications                ### Initial Draft
     3. Create asset manifest                         1. Fetch data via MCP
                                                      2. Generate first draft report
     ### Phase 2: Asset Storage (Drive MCP)           3. Save to temporary file
     1. Create project folder in Drive
     2. Upload all assets                             ### Quality Check
     3. Generate shareable links                      1. Run validation script: `scripts/check_report.py`
                                                      2. Identify issues:
     ### Phase 3: Task Creation (Linear MCP)
     1. Create development tasks                           - Missing sections
     2. Attach asset links to tasks                        - Inconsistent formatting
     3. Assign to engineering team                         - Data validation errors

     ### Phase 4: Notification (Slack MCP)            ### Refinement Loop
     1. Post handoff summary to #engineering          1. Address each identified issue
     2. Include asset links and task references       2. Regenerate affected sections
                                                      3. Re-validate
Key techniques:                                       4. Repeat until quality threshold met
· Clear phase separation
· Data passing between MCPs                           ### Finalization
· Validation before moving to next phase              1. Apply final formatting
· Centralized error handling                          2. Generate summary
                                                      3. Save final version

                                                 Key techniques:
                                                 · Explicit quality criteria
                                                 · Iterative improvement
                                                 · Validation scripts
                                                 · Know when to stop iterating

                                                                                                                                                                                            23
Pattern 4: Context-aware tool selection                        Pattern 5: Domain-specific intelligence

Use when: Same outcome, different tools depending on context.  Use when: Your skill adds specialized knowledge beyond tool access.

Example: File storage                                          Example: Financial compliance

     ## Smart File Storage                                          ## Payment Processing with Compliance

     ### Decision Tree                                              ### Before Processing (Compliance Check)
     1. Check file type and size                                    1. Fetch transaction details via MCP
     2. Determine best storage location:                            2. Apply compliance rules:

          - Large files (>10MB): Use cloud storage MCP                   - Check sanctions lists
          - Collaborative docs: Use Notion/Docs MCP                      - Verify jurisdiction allowances
          - Code files: Use GitHub MCP                                   - Assess risk level
          - Temporary files: Use local storage                      3. Document compliance decision

     ### Execute Storage                                            ### Processing
     Based on decision:                                             IF compliance passed:
     - Call appropriate MCP tool
     - Apply service-specific metadata                                 - Call payment processing MCP tool
     - Generate access link                                            - Apply appropriate fraud checks
                                                                       - Process transaction
     ### Provide Context to User                                    ELSE:
     Explain why that storage was chosen                               - Flag for review
                                                                       - Create compliance case
Key techniques:
· Clear decision criteria                                           ### Audit Trail
· Fallback options                                                  - Log all compliance checks
· Transparency about choices                                        - Record processing decisions
                                                                    - Generate audit report

                                                               Key techniques:
                                                               · Domain expertise embedded in logic
                                                               · Compliance before action
                                                               · Comprehensive documentation
                                                               · Clear governance

                                                                                                                                                                                                          24
Troubleshooting                                           # Wrong
                                                          name: My Cool Skill
Skill won't upload
                                                          # Correct
Error: "Could not find SKILL.md in uploaded folder"       name: my-cool-skill
Cause: File not named exactly SKILL.md
Solution:                                            Skill doesn't trigger
· Rename to SKILL.md (case-sensitive)
· Verify with: ls -la should show SKILL.md           Symptom: Skill never loads automatically
Error: "Invalid frontmatter"                         Fix:
Cause: YAML formatting issue                         Revise your description field. See The Description Field for good/bad examples.
Common mistakes:                                     Quick checklist:
                                                     · Is it too generic? ("Helps with projects" won't work)
     # Wrong - missing delimiters                    · Does it include trigger phrases users would actually say?
     name: my-skill                                  · Does it mention relevant file types if applicable?
     description: Does things                        Debugging approach:
                                                     Ask Claude: "When would you use the [skill name] skill?" Claude will quote the
     # Wrong - unclosed quotes                       description back. Adjust based on what's missing.
     name: my-skill
     description: "Does things                       Skill triggers too often

     # Correct                                       Symptom: Skill loads for unrelated queries
     ---                                             Solutions:
     name: my-skill                                  1. Add negative triggers
     description: Does things
     ---                                                  description: Advanced data analysis for CSV files. Use for
                                                          statistical modeling, regression, clustering. Do NOT use for
Error: "Invalid skill name"                               simple data exploration (use data-viz skill instead).
Cause: Name has spaces or capitals
                                                                                                                                                                                                25
2. Be more specific                                                  Instructions not followed

     # Too broad                                                     Symptom: Skill loads but Claude doesn't follow instructions
     description: Processes documents
                                                                     Common causes:
     # More specific                                                 1. Instructions too verbose
     description: Processes PDF legal documents for contract review
                                                                        ­ Keep instructions concise
3. Clarify scope                                                        ­ Use bullet points and numbered lists
                                                                        ­ Move detailed reference to separate files
     description: PayFlow payment processing for e-commerce. Use     2. Instructions buried
     specifically for online payment workflows, not for general         ­ Put critical instructions at the top
     financial queries.                                                 ­ Use ## Important or ## Critical headers
                                                                        ­ Repeat key points if needed
MCP connection issues                                                3. Ambiguous language

Symptom: Skill loads but MCP calls fail                                   # Bad
                                                                          Make sure to validate things properly
Checklist:
1. Verify MCP server is connected                                         # Good
                                                                          CRITICAL: Before calling create_project, verify:
   ­ Claude.ai: Settings > Extensions > [Your Service]                    - Project name is non-empty
   ­ Should show "Connected" status                                       - At least one team member assigned
2. Check authentication                                                   - Start date is not in the past
   ­ API keys valid and not expired
   ­ Proper permissions/scopes granted                               Advanced technique: For critical validations, consider bundling a script
   ­ OAuth tokens refreshed                                          that performs the checks programmatically rather than relying on language
3. Test MCP independently                                            instructions. Code is deterministic; language interpretation isn't. See the Office
   ­ Ask Claude to call MCP directly (without skill)                 skills for examples of this pattern.
   ­ "Use [Service] MCP to fetch my projects"                        4. Model "laziness" Add explicit encouragement:
   ­ If this fails, issue is MCP not skill
4. Verify tool names                                                      ## Performance Notes
   ­ Skill references correct MCP tool names                              - Take your time to do this thoroughly
   ­ Check MCP server documentation                                       - Quality is more important than speed
   ­ Tool names are case-sensitive                                        - Do not skip validation steps

                                                                     Note: Adding this to user prompts is more effective than in SKILL.md

                                                                                                                                                                                                                26
Large context issues

Symptom: Skill seems slow or responses degraded
Causes:
· Skill content too large
· Too many skills enabled simultaneously
· All content loaded instead of progressive disclosure
Solutions:
1. Optimize SKILL.md size

   ­ Move detailed docs to references/
   ­ Link to references instead of inline
   ­ Keep SKILL.md under 5,000 words
2. Reduce enabled skills
   ­ Evaluate if you have more than 20 - 50 skills enabled simultaneously
   ­ Recommend selective enablement
   ­ Consider skill "packs" for related capabilities

                                                                                                                                                                                                                                                                                                     27
  Chapter 6

Resources and
references

                                                                                                                                                                                                                                                                                                     28
  Chapter 6

Resources and references

If you're building your first skill, start with the Best Practices Guide, then  Tools and Utilities
reference the API docs as needed.
                                                                                skill-creator skill:
Official Documentation
                                                                                · Built into Claude.ai and available for Claude Code
Anthropic Resources:                                                            · Can generate skills from descriptions
                                                                                · Reviews and provides recommendations
· Best Practices Guide                                                          · Use: "Help me build a skill using skill-creator"
· Skills Documentation
· API Reference                                                                 Validation:
· MCP Documentation
                                                                                · skill-creator can assess your skills
Blog Posts:                                                                     · Ask: "Review this skill and suggest improvements"

· Introducing Agent Skills                                                      Getting Support
· Engineering Blog: Equipping Agents for the Real World
· Skills Explained                                                              For Technical Questions:
· How to Create Skills for Claude
· Building Skills for Claude Code                                               · General questions: Community forums at the Claude Developers Discord
· Improving Frontend Design through Skills
                                                                                For Bug Reports:
Example skills
                                                                                · GitHub Issues: anthropics/skills/issues
Public skills repository:                                                       · Include: Skill name, error message, steps to reproduce

· GitHub: anthropics/skills                                                                                                                                                                                                29
· Contains Anthropic-created skills you can customize
Reference A: Quick                                                                  Before upload
checklist
                                                                                         Tested triggering on obvious tasks
Use this checklist to validate your skill before and after upload. If you want           Tested triggering on paraphrased requests
a faster start, use the skill-creator skill to generate your first draft, then run       Verified doesn't trigger on unrelated topics
through this list to make sure you haven't missed anything.                              Functional tests pass
                                                                                         Tool integration works (if applicable)
Before you start                                                                         Compressed as .zip file

     Identified 2-3 concrete use cases                                              After upload
     Tools identified (built-in or MCP)
     Reviewed this guide and example skills                                              Test in real conversations
     Planned folder structure                                                            Monitor for under/over-triggering
                                                                                         Collect user feedback
During development                                                                       Iterate on description and instructions
                                                                                         Update version in metadata
     Folder named in kebab-case
     SKILL.md file exists (exact spelling)
     YAML frontmatter has --- delimiters
     name field: kebab-case, no spaces, no capitals
     description includes WHAT and WHEN
     No XML tags (< >) anywhere
     Instructions are clear and actionable
     Error handling included
     Examples provided
     References clearly linked

                                                                                                                                       30
Reference B: YAML                                                      Security notes
frontmatter
                                                                       Allowed:
Required fields
                                                                       · Any standard YAML types (strings, numbers, booleans, lists, objects)
     ---                                                               · Custom metadata fields
     name: skill-name-in-kebab-case                                    · Long descriptions (up to 1024 characters)
     description: What it does and when to use it. Include specific
     trigger phrases.                                                  Forbidden:
     ---
                                                                       · XML angle brackets (< >) - security restriction
All optional fields                                                    · Code execution in YAML (uses safe YAML parsing)
                                                                       · Skills named with "claude" or "anthropic" prefix (reserved)
     name: skill-name
     description: [required description]
     license: MIT # Optional: License for open-source
     allowed-tools: "Bash(python:*) Bash(npm:*) WebFetch" # Optional:
     Restrict tool access
     metadata: # Optional: Custom fields

        author: Company Name
        version: 1.0.0
        mcp-server: server-name
        category: productivity
        tags: [project-management, automation]
        documentation: https://example.com/docs
        support: support@example.com

                                                                                                                                               31
Reference C: Complete skill
examples

For full, production-ready skills demonstrating the patterns in this guide:
· Document Skills - PDF, DOCX, PPTX, XLSX creation
· Example Skills - Various workflow patterns
· Partner Skills Directory - View skills from various partners such as Asana,

   Atlassian, Canva, Figma, Sentry, Zapier, and more
These repositories stay up-to-date and include additional examples beyond
what's covered here. Clone them, modify them for your use case, and use them as
templates.

                                                                                                                                                                                                                                                                                                     32
claude.ai
