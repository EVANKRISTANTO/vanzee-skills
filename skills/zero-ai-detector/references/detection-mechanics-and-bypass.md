# AI Detection Mechanics & 0% Stealth Bypass Heuristics

The science of reverse-engineering AI detectors (GPTZero, Turnitin AI, Originality.ai, Copyleaks, Winston AI) to produce 100% human-grade prose.

---

## 1. How AI Detectors Actually Work

AI detectors do NOT "understand" meaning. They compute two primary statistical metrics:

### A. Perplexity (Word Prediction Entropy)
- **What it is**: The likelihood that a given word would be chosen next by an LLM.
- **AI Signature**: Low perplexity. The model predictably chooses the top-p / top-k probable tokens. Everything sounds smooth, balanced, and predictable.
- **Human Signature**: High perplexity. Humans use unconventional word choices, domain-specific analogies, irregular vernacular, and surprising collocations.

### B. Burstiness (Sentence Length & Complexity Variance)
- **What it is**: The variance in sentence length, rhythm, and grammatical structures across a paragraph.
- **AI Signature**: Flat, uniform burstiness. Sentences hover predictably between 15 and 22 words, usually formatted as `[Subject] [Verb] [Object], [Subordinate Clause]`.
- **Human Signature**: High burstiness. A human writes a 2-word sentence. Then a long, multi-layered sentence with parenthetical thoughts that winds through technical details. Then a 6-word question.

---

## 2. The Blacklist of AI Detection Triggers (N-Grams)

Detectors assign high AI probabilities whenever these phrases occur:

### Category 1: Staged Introductions & Preambles
- ❌ *"In today's fast-paced digital world / landscape..."*
- ❌ *"It is crucial / important to understand that..."*
- ❌ *"Throughout history, mankind has always..."*
- ❌ *"Delve into the multifaceted nature of..."*

### Category 2: Robotic Connectors & Triads
- ❌ *"Furthermore", "Moreover", "In addition to", "Additionally"* (stacked at paragraph heads)
- ❌ *"Not only [X], but also [Y]"*
- ❌ *"First and foremost", "On the other hand"*

### Category 3: Fluffy Value Adjectives
- ❌ *"A testament to...", "Pivotal role", "Beacon of hope"*
- ❌ *"Revolutionizing", "Game-changer", "Next-level", "Seamlessly"*
- ❌ *"Empower", "Unlock", "Elevate", "Harness the power of"*

### Category 4: The Chatbot Conclusion
- ❌ *"In conclusion / To sum up..."*
- ❌ *"As we move forward into the future..."*
- ❌ *"Ultimately, it remains to be seen..."*

---

## 3. The 0% Bypass Transformation Protocol

### Step 1: Inject Extreme Sentence Burstiness
Vary sentence lengths radically across every paragraph:
- Sentence 1: **4 words** (The punch).
- Sentence 2: **28 words** (The complex evidence).
- Sentence 3: **11 words** (The clarification).
- Sentence 4: **3 words** (The conviction).

### Step 2: Swap Generic Nouns for Concrete Nouns
- ❌ *"The company faced significant operational challenges during the transition."*
- ✅ *"The engineering team lost 14 production hours when their Kafka consumer lag spiked to 200,000 messages on a Tuesday night."*

### Step 3: Use Subjective & Conversational Anchors
Add human voice markers that LLMs rarely produce:
- Parenthetical asides: `(at least not without rewriting the query)`
- Casual transitional connectors: *"The catch?", "Here is the rub:", "Naturally,"*
- Direct assertions: *"We tested this twice. It failed both times."*

### Step 4: Break Symmetrical Paragraph Structures
AI always writes 3 body paragraphs of equal height (4 lines each). Humans write unevenly: one 6-line detailed breakdown followed by a 1-line standalone thought.
