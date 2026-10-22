# B2B Sales, Outbound & Pitch Engineering

Communication scripts and frameworks designed for senior decision-makers (Founders, CTOs, VPs, Heads of Product).

---

## 1. High-Response B2B Outbound Emails

Decision-makers delete 98% of cold emails because they smell like automated templates. To earn a reply, an email must look like it was written manually by an informed peer in under 90 seconds.

### The 4-Sentence Cold Outbound Framework:
1. **The Specific Observation (Proof you did homework)**: Naming an exact public event, job posting, repo issue, or release note.
2. **The High-Cost Friction**: Naming the exact hidden problem that occurs in that situation.
3. **The Concrete Solution / Proof**: How a similar company solved it with measurable metrics.
4. **The Low-Friction Permission CTA**: Asking for permission, not a 30-minute calendar block.

### Example: Outbound to a VP of Engineering
> **Subject**: quick question on your kubernetes migration
>
> Hi Alex,
>
> Noticed your team recently posted openings for 3 senior SREs focused on your multi-region EKS rollout.
>
> Most infrastructure teams hit unexpected egress bill spikes and inter-AZ latency bottlenecks during this exact migration phase.
>
> We helped Stripe's former platform leads reduce inter-cluster egress costs by 38% with a zero-proxy eBPF routing mesh.
>
> Worth a brief note on how we configured their envoy filters, or is this already solved on your side?
>
> Best,  
> Evan

---

## 2. Executive Proposal Architecture (Closing High-Ticket Deals)

When sending a formal proposal or statement of work (SOW), structure it to prevent procurement stall:

### Section 1: Executive Summary & Current State Diagnosis
- Clearly define the company's current bottleneck in their words.
- Define the direct business cost of doing nothing: *"At current churn rates, unaddressed latency regressions will cost an estimated $120,000 in monthly recurring revenue over the next two quarters."*

### Section 2: Scope of Work & Deliverables
- Bulleted milestones with binary acceptance criteria (either it is done and passes tests or it isn't).
- Explicit non-goals (*"What is NOT included to maintain speed and focus"*).

### Section 3: Commercials & Phased Investment
- Present pricing as a clean, predictable fixed investment or phased milestone release.
- Frame investment against upside: *"Total project investment: $45,000 (representing less than 15% of projected first-year infrastructure savings)."*

---

## 3. Objection Handling Heuristics

### A. *"It's too expensive / We don't have the budget."*
- **Reframe**: *"Budget is always a reflection of priority. If this doesn't save you at least 3x the contract value in engineering hours and server costs within 90 days, we shouldn't do it. Let's look at the math together."*

### B. *"We're planning to build this in-house."*
- **Reframe**: *"Your engineers certainly have the talent to build this. The question is opportunity cost: will having 2 senior engineers spend 6 months building an internal auth service move your core product needle faster than having them ship your flagship enterprise features?"*

### C. *"We already use [Big Competitor]."*
- **Reframe**: *"We respect [Competitor]; they are great for broad general use. Our clients switched because [Competitor] charges a 40% margin on data transfer and takes 3 weeks to respond to support tickets. We deploy inside your own AWS account with dedicated Slack channel access."*
