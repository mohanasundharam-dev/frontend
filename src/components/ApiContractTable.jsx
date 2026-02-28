const endpoints = [
  ['GET', '/api/v1/products/', 'Product list with stock summary'],
  ['POST', '/api/v1/purchases/', 'Create purchase invoice + stock entries'],
  ['POST', '/api/v1/bills/', 'Create sales bill + taxes + payment split'],
  ['GET', '/api/v1/reports/sales-summary/', 'Sales report by date / customer / product'],
  ['GET', '/api/v1/customers/:id/ledger/', 'Customer outstanding and transaction log']
]

const ApiContractTable = () => {
  return (
    <div className="card overflow-x-auto">
      <h2 className="mb-3 text-lg font-semibold text-slate-800">DRF API Contract (Starter)</h2>
      <table className="min-w-full text-left text-sm">
        <thead className="bg-slate-50 text-slate-600">
          <tr>
            <th className="px-3 py-2">Method</th>
            <th className="px-3 py-2">Endpoint</th>
            <th className="px-3 py-2">Purpose</th>
          </tr>
        </thead>
        <tbody>
          {endpoints.map(([method, endpoint, purpose]) => (
            <tr key={endpoint} className="border-t border-slate-100">
              <td className="px-3 py-2 font-semibold text-primary">{method}</td>
              <td className="px-3 py-2 font-mono text-xs">{endpoint}</td>
              <td className="px-3 py-2 text-slate-600">{purpose}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default ApiContractTable
