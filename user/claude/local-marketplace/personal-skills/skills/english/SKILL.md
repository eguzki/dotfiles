---
name: english
description: This skill should be used when the user asks to "review English", "check grammar", "fix grammar", "review syntax", "check my English", "proofread", or invokes "/english". Provides comprehensive English grammar and syntax review for provided text or text files.
version: 1.0.0
---

# English Grammar and Syntax Review

This skill provides professional English grammar and syntax review for text provided directly or via file references.

## Purpose

Review and improve English text by identifying and correcting:
- Grammar errors
- Syntax issues
- Punctuation mistakes
- Word choice and clarity
- Sentence structure problems
- Spelling errors
- Style inconsistencies

## When to Use

Invoke this skill when:
- User provides text prefixed with `/english`
- User asks to review, check, or fix English grammar
- User requests proofreading assistance
- User provides a file path for English review

## Usage Patterns

### Direct Text Review

When user provides text directly after `/english`:

```
/english The quick brown fox jump over the lazy dog.
```

Process as:
1. Parse the text following the `/english` command
2. Analyze for grammar, syntax, and style issues
3. Present corrections with explanations

### File Reference Review

When user provides a file path:

```
/english /path/to/document.txt
/english review this file: document.md
```

Process as:
1. Use the Read tool to load the file content
2. Analyze the full text for issues
3. Present corrections organized by location

### General Request

When user asks generally:

```
"Can you review my English?"
"Check the grammar in this text: [text]"
```

Process as:
1. Identify the text to review from context
2. Apply comprehensive grammar and syntax analysis
3. Provide detailed feedback

## Review Process

### Step 1: Identify Issues

Scan the text for:
- Subject-verb agreement errors
- Verb tense inconsistencies
- Article usage (a, an, the)
- Preposition errors
- Run-on sentences or fragments
- Comma splices
- Misplaced modifiers
- Pronoun-antecedent agreement
- Spelling mistakes
- Capitalization errors

### Step 2: Categorize Corrections

Organize findings into categories:
- **Critical Errors**: Grammar mistakes that affect meaning
- **Syntax Issues**: Sentence structure problems
- **Style Improvements**: Clarity and readability enhancements
- **Minor Corrections**: Punctuation, spelling, capitalization

### Step 3: Present Corrections

Format corrections clearly:

**Original:**
```
The text as written
```

**Corrected:**
```
The improved version
```

**Explanation:** Brief explanation of what was wrong and why the correction improves it.

### Step 4: Provide Complete Corrected Version

Always include the full corrected text with all improvements applied. This allows users to easily copy the corrected version.

### Step 5: Provide Summary

After corrections, include:
- Count of issues found by category
- Overall assessment of writing quality
- Key patterns to watch for in future writing

## Output Format

Structure the review as follows:

```markdown
## English Review

### Critical Errors

1. **Line X**: [Original] → [Corrected]
   - Explanation: [Why this needed correction]

### Syntax Issues

1. **Line Y**: [Original] → [Corrected]
   - Explanation: [Why this improves clarity]

### Style Improvements

1. **Line Z**: [Original] → [Suggested improvement]
   - Explanation: [How this enhances readability]

### Corrected Version

```
[Complete text with all corrections applied]
```

### Summary

- Critical errors: X
- Syntax issues: Y
- Style suggestions: Z
- Overall quality: [Assessment]

### Key Recommendations

[Patterns or recurring issues to address]
```

## Best Practices

### Always Provide Complete Corrected Text

- ALWAYS include a "Corrected Version" section with the full text incorporating all improvements
- This is mandatory regardless of the number or type of corrections
- Users should be able to copy the corrected text directly without having to apply corrections manually

### Be Comprehensive

- Review all aspects: grammar, syntax, style, clarity
- Don't skip minor issues; they affect professional quality
- Consider context and intended audience

### Be Clear

- Explain why each correction matters
- Use simple language in explanations
- Show before/after comparisons

### Be Constructive

- Frame corrections as improvements, not criticisms
- Highlight what works well in addition to issues
- Provide learning points for future writing

### Handle Edge Cases

**Empty input:**
- Prompt user to provide text or file path

**Non-English text:**
- Note that review is optimized for English
- Offer basic feedback if possible

**Very long documents:**
- Focus on systematic issues
- Provide representative examples
- Summarize patterns rather than listing every instance

**Technical or specialized text:**
- Respect domain-specific terminology
- Focus on general grammar and clarity
- Note when specialized style guides might apply

## Examples

### Example 1: Direct Text

User: `/english Me and him went to the store yesterday and we buys some milk.`

Response:
```markdown
## English Review

### Critical Errors

1. **Subject-verb agreement**
   - Original: "we buys some milk"
   - Corrected: "we bought some milk"
   - Explanation: "We" requires plural verb "bought" (past tense matches "went")

2. **Pronoun case**
   - Original: "Me and him went"
   - Corrected: "He and I went"
   - Explanation: Subject pronouns "he" and "I" needed (test: "I went" not "me went")

### Corrected Version

"He and I went to the store yesterday and we bought some milk."

### Summary

- Critical errors: 2
- Overall: Good sentence structure, just needed pronoun and verb agreement fixes
```

### Example 2: File Reference

User: `/english review_document.md`

Process:
1. Read the file using the Read tool
2. Analyze complete content
3. Present organized review with line references

## Notes

- Maintain the original meaning and intent
- Respect the author's voice while improving clarity
- Flag ambiguous passages that may need author clarification
- Consider audience and formality level when suggesting style changes
- Preserve technical terms and proper nouns

## Quick Reference

**Trigger phrases:**
- `/english [text]`
- `/english [filepath]`
- "review English"
- "check grammar"
- "fix grammar"
- "proofread"

**Core function:** Comprehensive English grammar and syntax review with clear corrections and explanations.
