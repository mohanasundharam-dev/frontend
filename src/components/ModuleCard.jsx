const ModuleCard = ({ module }) => {
  return (
    <article className="card transition hover:-translate-y-0.5 hover:shadow-md">
      <div className="mb-2 text-xs font-semibold uppercase tracking-wide text-accent">{module.key}</div>
      <h3 className="text-lg font-semibold text-slate-800">{module.name}</h3>
      <p className="mt-2 text-sm text-slate-500">{module.description}</p>
    </article>
  )
}

export default ModuleCard
