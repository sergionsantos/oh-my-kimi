# Componentes em Falta - OMK vs OMC Original

## 📊 Resumo Comparativo

| Categoria | OMC Original | OMK Atual | Em Falta |
|-----------|-------------|-----------|----------|
| **Agentes** | 19 | 32 | 0 (temos mais!) |
| **Skills** | 33 | 16 | 17 |

---

## ✅ Agentes que TEMOS (32 total)

OMK tem **todos os agentes do OMC original** + extras:

### Todos os 19 do OMC Original:
1. ✅ analyst
2. ✅ architect
3. ✅ code-reviewer
4. ✅ critic
5. ✅ debugger
6. ✅ designer
7. ✅ executor
8. ✅ explore
9. ✅ git-master
10. ✅ planner
11. ✅ qa-tester
12. ✅ security-reviewer
13. ✅ test-engineer
14. ✅ verifier
15. ✅ writer

### Agentes Extras no OMK (13 adicionais):
16. ✅ api-reviewer
17. ✅ backend-specialist
18. ✅ database-expert
19. ✅ data-scientist
20. ✅ dependency-expert
21. ✅ devops-engineer
22. ✅ frontend-specialist
23. ✅ information-architect
24. ✅ mobile-developer
25. ✅ performance-reviewer
26. ✅ product-analyst
27. ✅ product-manager
28. ✅ quality-strategist
29. ✅ researcher
30. ✅ style-reviewer
31. ✅ ux-researcher
32. ✅ vision

---

## ❌ Skills em FALTA (17 skills)

### Skills Críticas (Recomendado implementar):

| # | Skill | Descrição | Prioridade |
|---|-------|-----------|------------|
| 1 | **ask** | Pergunta a Claude/Codex/Gemini e captura artifact | ⭐⭐⭐ Alta |
| 2 | **ccg** | Tri-model advisor (Claude + Codex + Gemini) | ⭐⭐⭐ Alta |
| 3 | **deepinit** | Gera AGENTS.md hierárquico | ⭐⭐ Média |
| 4 | **hud** | Configura display HUD | ⭐⭐ Média |
| 5 | **learner** | Extrai skill reutilizável da sessão | ⭐⭐ Média |
| 6 | **mcp-setup** | Configura servidores MCP | ⭐⭐ Média |
| 7 | **note** | Salva notas para resiliência | ⭐ Média |
| 8 | **omc-teams** | Integração com Teams nativo | ⭐⭐⭐ Alta |
| 9 | **project-session-manager (psm)** | Ambientes dev isolados | ⭐⭐ Média |
| 10 | **ralph-init** | Inicializa PRD para ralph estruturado | ⭐⭐ Média |
| 11 | **release** | Workflow de release automatizado | ⭐⭐ Média |
| 12 | **skill** | Gerencia skills locais | ⭐ Média |
| 13 | **trace** | Mostra timeline de execução | ⭐⭐ Média |
| 14 | **web-clone** | Clona websites | ⭐ Baixa |
| 15 | **configure-notifications** | Configura notificações | ⭐ Baixa |
| 16 | **writer-memory** | Memória agentica para writers | ⭐ Baixa |
| 17 | **setup** | Setup unificado (diferente de omc-setup) | ⭐ Média |

---

## 🎯 Recomendações de Prioridade

### Prioridade 1 - Essenciais (Implementar primeiro):
1. **ask** - Permite perguntar a múltiplos AIs
2. **ccg** - Tri-model synthesis (Claude + Codex + Gemini)
3. **omc-teams** - Team mode nativo do Claude
4. **note** - Persistência de notas

### Prioridade 2 - Úteis (Implementar depois):
5. **deepinit** - Geração de AGENTS.md
6. **hud** - HUD display
7. **learner** - Extração de skills
8. **mcp-setup** - Configuração MCP
9. **project-session-manager** - Isolamento de ambientes
10. **trace** - Timeline de execução

### Prioridade 3 - Nice-to-have:
11. **release** - Releases
12. **skill** - Gestão de skills
13. **web-clone** - Clonagem
14. **configure-notifications** - Notificações
15. **writer-memory** - Memória de writer
16. **ralph-init** - Init de ralph
17. **setup** - Setup alternativo

---

## 📋 Agentes Específicos do OMC que Faltam Verificar

De acordo com a lista original, temos TODOS exceto possivelmente:
- **code-simplifier** - Pode estar coberto por `ai-slop-cleaner`
- **document-specialist** - Pode estar coberto por `researcher` ou `writer`
- **scientist** - Pode estar coberto por `sciomc` skill
- **tracer** - Pode estar coberto por `trace` skill

---

## 🔧 Ações Recomendadas

Para ter uma réplica fiel do OMC, seria necessário:

### Mínimo Viável (MV)
- [ ] Criar skill `ask`
- [ ] Criar skill `ccg`
- [ ] Criar skill `note`
- [ ] Criar skill `trace`

### Completo
- [ ] Criar as 17 skills em falta
- [ ] Criar agente `code-simplifier` (se não existir)
- [ ] Criar agente `document-specialist` (se não existir)

---

## 💡 Nota Importante

OMK já tem **mais agentes** que o OMC original (32 vs 19). A diferença principal está nas **skills de utilidade** e **integrações** (MCP, HUD, notificações, etc).

O core de orquestração multi-agente está completo e funcional!
