import Header from './layout/Header'
import ModuleCard from './components/ModuleCard'
import ApiContractTable from './components/ApiContractTable'
import { modules } from './config/navigation'

function App() {
  return (
    <main className="mx-auto flex min-h-screen max-w-6xl flex-col gap-6 p-4 md:p-8">
      <Header />

      <section>
        <h2 className="mb-3 text-lg font-semibold text-slate-800">Core Modules</h2>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {modules.map((module) => (
            <ModuleCard key={module.key} module={module} />
          ))}
        </div>
      </section>

      <ApiContractTable />
    </main>
  )
}

export default App
