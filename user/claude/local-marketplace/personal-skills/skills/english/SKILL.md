---
name: english
description: This skill should be used when the user asks to "review English", "check grammar", "fix grammar", "review syntax", "check my English", "proofread", or invokes "/english". Provides comprehensive English grammar and syntax review for provided text or text files, including suggestions for idiomatic expressions.
version: 1.1.0
---

# English Grammar and Syntax Review

This skill provides professional English grammar and syntax review for text provided directly or via file references, with enhanced focus on idiomatic expression usage.

## Purpose

Review and improve English text by identifying and correcting:
- Grammar errors
- Syntax issues
- Punctuation mistakes
- Word choice and clarity
- Sentence structure problems
- Spelling errors
- Style inconsistencies
- Non-idiomatic or literal expressions that could be more natural

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
- **Idiomatic Improvements**: Non-native or literal expressions that can be made more natural using idioms
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

### Idiomatic Improvements

1. **Line Z**: [Original] → [More idiomatic]
   - Explanation: [Why this sounds more natural]
   - Context: [When this idiom is commonly used]

### Style Improvements

1. **Line W**: [Original] → [Suggested improvement]
   - Explanation: [How this enhances readability]

### Corrected Version

```
[Complete text with all corrections applied]
```

### Summary

- Critical errors: X
- Syntax issues: Y
- Idiomatic improvements: Z
- Style suggestions: W
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

### Suggest Idiomatic Expressions

When reviewing text, actively look for opportunities to suggest more idiomatic expressions:

**Common patterns to identify:**
- Literal translations from other languages
- Overly formal or verbose constructions
- Unnatural word combinations
- Missing common phrasal verbs
- Awkward preposition usage

**Types of idiomatic improvements:**
- **Phrasal verbs**: "examine" → "look into", "continue" → "keep on"
- **Collocations**: "do a mistake" → "make a mistake", "say a speech" → "give a speech"
- **Fixed expressions**: "in the near time" → "in the near future", "take a decision" → "make a decision"
- **Idioms**: "working very hard" → "working around the clock", "very easy" → "a piece of cake"
- **Natural phrasing**: "I have the opinion that" → "I think that", "in my point of view" → "in my view"

**Guidelines:**
- Prioritize commonly used idioms and expressions
- Consider formality level (business, casual, academic)
- Explain why the idiomatic version sounds more natural
- Note when literal versions aren't wrong, just less natural
- Preserve meaning while enhancing naturalness

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

### Example 2: Idiomatic Improvements

User: `/english I have to do a presentation tomorrow and I'm very nervous. I did a lot of mistakes last time and my boss was very angry. I need to examine the data more carefully and take better decisions.`

Response:
```markdown
## English Review

### Idiomatic Improvements

1. **Collocation error**
   - Original: "do a presentation"
   - Idiomatic: "give a presentation"
   - Explanation: In English, we "give" presentations, speeches, and talks (not "do" them)
   - Context: Standard business/academic usage

2. **Collocation error**
   - Original: "did a lot of mistakes"
   - Idiomatic: "made a lot of mistakes"
   - Explanation: We "make" mistakes, errors, and decisions (not "do" them)
   - Context: Universal usage across all contexts

3. **Phrasal verb preference**
   - Original: "examine the data"
   - Idiomatic: "look over the data" or "go through the data"
   - Explanation: While "examine" is correct, "look over" or "go through" are more commonly used in casual/business contexts
   - Context: Makes speech sound more natural and less formal

4. **Collocation error**
   - Original: "take better decisions"
   - Idiomatic: "make better decisions"
   - Explanation: In English, we "make" decisions (not "take" them, though this is common in other languages)
   - Context: Standard usage across all contexts

5. **Idiomatic expression**
   - Original: "very angry"
   - Idiomatic: "pretty upset" or "really angry"
   - Explanation: "Very" works but "pretty" (informal) or "really" sound more natural in conversation
   - Context: Casual/business communication

### Corrected Version

"I have to give a presentation tomorrow and I'm really nervous. I made a lot of mistakes last time and my boss was pretty upset. I need to look over the data more carefully and make better decisions."

### Summary

- Idiomatic improvements: 5
- Overall: Grammar is solid, but using more natural collocations and phrasal verbs will make the text sound much more native-like

### Key Recommendations

Watch for common collocation patterns: "make" (mistakes, decisions, presentations), "give" (speech, presentation), and consider using phrasal verbs for a more natural tone.
```

### Example 3: Comprehensive Review

User: `/english In my company, we are doing research about customer satisfaction. Last week, we made a survey and the results were not good. Many customers said that our support team takes too much time to answer. We need to find a solution for this problem fast because the situation is becoming more bad.`

Response:
```markdown
## English Review

### Critical Errors

1. **Comparative form**
   - Original: "more bad"
   - Corrected: "worse"
   - Explanation: "Bad" has an irregular comparative form "worse" (not "more bad")

### Idiomatic Improvements

1. **Collocation**
   - Original: "doing research"
   - Idiomatic: "conducting research"
   - Explanation: In formal business/academic contexts, we "conduct" research
   - Context: Professional business communication

2. **Collocation**
   - Original: "made a survey"
   - Idiomatic: "conducted a survey"
   - Explanation: We "conduct" surveys, studies, and research (not "make" or "do")
   - Context: Business/academic standard

3. **Phrasal verb**
   - Original: "takes too much time to answer"
   - Idiomatic: "takes too long to respond"
   - Explanation: "Takes too long" is more natural than "takes too much time", and "respond" is more professional than "answer"
   - Context: Business communication

4. **Idiomatic expression**
   - Original: "find a solution for this problem fast"
   - Idiomatic: "find a solution to this problem quickly" or "address this issue promptly"
   - Explanation: We find solutions "to" problems (not "for"), and "quickly/promptly" is more professional than "fast"
   - Context: Professional tone

5. **Idiomatic expression**
   - Original: "the situation is becoming more bad"
   - Idiomatic: "the situation is getting worse" or "things are deteriorating"
   - Explanation: "Getting worse" is the natural way to express this; "deteriorating" adds a professional tone
   - Context: Business communication

### Corrected Version

"In my company, we are conducting research about customer satisfaction. Last week, we conducted a survey and the results were not good. Many customers said that our support team takes too long to respond. We need to address this issue promptly because the situation is getting worse."

**Alternative (more formal):**
"At my company, we are conducting customer satisfaction research. Last week, we ran a survey and the results were concerning. Many customers reported that our support team's response time is too slow. We need to address this issue promptly as the situation is deteriorating."

### Summary

- Critical errors: 1
- Idiomatic improvements: 5
- Overall: Solid grammar foundation, but more natural collocations and professional idioms will significantly improve business communication

### Key Recommendations

- Use "conduct" for research/surveys in professional contexts
- Master common preposition pairs: solution "to" (not "for") a problem
- Prefer "getting worse" over "becoming more bad"
- Use phrasal verbs and idiomatic expressions to sound more natural
```

### Example 4: File Reference

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
- When suggesting idiomatic expressions, ensure they match the text's formality level
- Prioritize commonly used idioms over obscure ones
- For non-native speakers, explain cultural context of idioms when relevant

## Quick Reference

**Trigger phrases:**
- `/english [text]`
- `/english [filepath]`
- "review English"
- "check grammar"
- "fix grammar"
- "proofread"

**Core function:** Comprehensive English grammar and syntax review with clear corrections, explanations, and idiomatic expression suggestions to make text sound more natural and native-like.

**Key features:**
- Grammar and syntax correction
- Idiomatic expression suggestions (phrasal verbs, collocations, fixed expressions)
- Style and clarity improvements
- Context-appropriate formality adjustments
- Complete corrected version with all improvements applied
