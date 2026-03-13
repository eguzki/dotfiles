# Personal Skills Plugin

A collection of custom workflow skills for personal productivity.

## Skills Included

### `/english` - English Grammar and Syntax Review

Reviews English text for grammar, syntax, and style issues.

**Usage:**

```bash
# Review text directly
/english The text you want to review goes here.

# Review a file
/english /path/to/document.txt

# Natural language
"Can you review my English in this text: [your text]"
"Check the grammar in document.md"
```

**Features:**
- Comprehensive grammar checking
- Syntax and structure analysis
- Style improvements
- Clear before/after corrections
- Explanations for each change

## Installation

### Option 1: Use with --plugin-dir

```bash
claude --plugin-dir /home/eguzki/.claude/plugins/local/personal-skills
```

### Option 2: Add to Claude CLI config

```bash
claude plugin install /home/eguzki/.claude/plugins/local/personal-skills
```


## Adding More Skills

To add additional personal skills:

1. Create a new directory in `skills/`
2. Add a `SKILL.md` file with proper frontmatter
3. Follow the Claude Code skill development guidelines

## Structure

```
personal-skills/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
├── skills/
│   └── english/
│       └── SKILL.md         # English review skill
└── README.md                # This file
```

## Version

1.0.0
