const Header = () => {
  return (
    <header className="card flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
      <div>
        <h1 className="text-2xl font-bold text-slate-900">Medical Billing Master</h1>
        <p className="text-sm text-slate-500">React + Vite frontend ready for Django DRF APIs</p>
      </div>
      <div className="rounded-lg bg-teal-50 px-4 py-2 text-sm font-medium text-primary">
        Future backend: Django + DRF
      </div>
    </header>
  )
}

export default Header
